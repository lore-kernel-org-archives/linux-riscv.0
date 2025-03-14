Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA21C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnwuMLboJHm1Byz/vvdynmWzI36Z9ZY4ibUrKtKukHc=; b=PORr1xYyFRmqsD
	0W/CN7HG02gR8He/32qZcXq/pvSvJh30W6Eh6Q77RA6lJSlRkja98aPo6EBOWjh1NZV7zBsQX7Q/q
	Y4m5wHyOHBnTC8E8hh74xPxu7rTeLRCAXk88h8Ess6OO7IrL/zTnh5g55wpGzM7+pjFIivFpd/EJF
	swHUwHw2osE0mt3jT9MIYeN7MlY3lp1lcdbqvRqqapKHehpXlPW1qV7uiOR5ALDcb/H3+7Ff/Auq+
	W4QW4/loXsVY4ny6T4NnMfkLYQpeRizW8gMg/q/pmyTSuDTCX040I/+nhyy3HlBk1wJVaLO6kUEX4
	wVdiNRqK5z+EXGw6lGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lJ-0000000DXLq-3Agv;
	Fri, 14 Mar 2025 08:51:25 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0TF-0000000DUHj-0UqW
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:32:46 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso67179139f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941164; x=1742545964; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCEdsaw1oyyep+pTm33AMqwczcmyjWKaR0i6JEzwbws=;
        b=DBWKbmT7WVNb5VaTdjNBb1A7LztYK7LCw4Q3clBvljBvF+gLgrh+sQvr73ck4Ep7se
         X3uDUv1UtNAplK37a/wbzKg0dsgAm3H9rJZaevrwAkd/DEBFkynofzz1kku33+a9GR5W
         mkChkU20v3/rkYjbuMx9xIanDysK6ISGxEi3MxXd02pJfM66SSC6/FPyzsrRmhbV2I44
         7b8+Gsbf3XSy8b6Jw8rro7Qjobri5icdT8GEZ96BtmaKCeueolEJNfZPNhQF/cv693dq
         1C97nZTs896abbD/dYmh40+3ivcRth9lvJNnf2RN3p5mYXk24j6vXBjuJhtXwvfMEJG0
         b1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941164; x=1742545964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCEdsaw1oyyep+pTm33AMqwczcmyjWKaR0i6JEzwbws=;
        b=S2nR+Q7mA5x8QN7LEav+CKQ9ut9q3Wg8Uk5gkowjgVdgjN2BD5Yz8qR8l152lWb1hh
         FiapdpEutjE9UShVO2hPmo+Qk2UeHXDLjj7cHw+CyyD41S9UUUMC1F1ZNUsDBa4n/ubH
         6SEVIwxBdG69YzsX0zb+XalrriolIvSaxuCgIPfGKGo0lSVa1c9rq3YmClB3VYJTyEvi
         iJVToKFT1I1T915cgfbrYwv9S04eFWwhhrM8m8RCFzpCgj/2Bp2JACLBRt4J47THvtxs
         M7bt7Ftdpx/AYcXWPK9l6UAa0sQOH22L5cdlgyEFKXiJ+XbSDBIz4dbZBSyq2nEnIOQ6
         bjgw==
X-Forwarded-Encrypted: i=1; AJvYcCW60gl8tMId/wup7j34/WcXWrTIUGJy6HYha5p5kD4axBABVfJh2HqbZwy5UUvXBZ/Bhy+Bx03Sja83iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIjDdWpSOnNa4XI3Ez+bom+AdYdzJh0ZFYoRshoMlS89lzPVfa
	t49FOCGD1V4Dw0dMc0zIQ5NEflS/lrdaDOKl7ua8UnHtHsooY92Bi5EJIY5HEjGdcGZGdNxOYXg
	a9yX5RDapkPaSe6SQ1EvCz9R8mnZSPqlOhdB8jg==
X-Gm-Gg: ASbGncu4/r+e2fe5e/CtLR53UxyAjKiPbVHOmoFEOnqk0dXuXQkanGEVj5EvA5hBTMG
	pT/dIGNjspcA9g13FET3Ip7XnNP7ndSoKYZ5BCyBOFa7O0Co4t15WdGNnIHwX8Bl6Ip49mBbouk
	/7w5JWFW44WIMVu32NYIORLStwLlOXQM2CiQ6gSQ==
X-Google-Smtp-Source: AGHT+IGKKeRG0A/9f+JHf97yjfLfnO62m5yl+Eo+sZz+dUYEVwFJcclhLB8DsFnVREzfJfzDV8kA5GzC++92Tg4ye+4=
X-Received: by 2002:a5d:9045:0:b0:85b:468a:2d0d with SMTP id
 ca18e2360f4ac-85db8453251mr488127139f.2.1741941163997; Fri, 14 Mar 2025
 01:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-19-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-19-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:32:33 +0800
X-Gm-Features: AQ5f1JpuAaWcQ0pYamP7IOKg48HxBlHKjlIDLSO70pqk0-vnHFKYhjS3tUoOFGI
Message-ID: <CANXhq0pXT_vJxyPPGJyVoBsBesmS642JzcmP111rDdYCzkLJaw@mail.gmail.com>
Subject: Re: [PATCH v11 19/27] riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_013245_155327_C6C4B849 
X-CRM114-Status: GOOD (  14.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDLigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGRpbmcgZW51bWVyYXRpb24gb2YgemljZmlscCBhbmQg
emljZmlzcyBleHRlbnNpb25zIGluIGh3cHJvYmUgc3lzY2FsbC4KPgo+IFNpZ25lZC1vZmYtYnk6
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jICAgICAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gaW5kZXggYzNjMWNjOTUx
Y2I5Li5jMWI1MzdiNTAxNTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKPiBAQCAtNzMsNiArNzMsOCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4gICNkZWZpbmUg
ICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWkNNT1AgICAgICAgICAoMVVMTCA8PCA0
NykKPiAgI2RlZmluZSAgICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQVdSUyAgICAg
ICAgICgxVUxMIDw8IDQ4KQo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVf
RVhUX1NVUE0gICAgICAgICAgKDFVTEwgPDwgNDkpCj4gKyNkZWZpbmUgICAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9FWFRfWklDRklMUCAgICAgICAoMVVMTCA8PCA1MCkKPiArI2RlZmluZSAg
ICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNGSVNTICAgICAgICgxVUxMIDw8IDUx
KQo+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMCAgICA1Cj4gICNkZWZpbmUg
ICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04gICAgICAgICgw
IDw8IDApCj4gICNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X0VNVUxBVEVEICAgICAgICgxIDw8IDApCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gaW5kZXgg
YmNkM2I4MTYzMDZjLi5kODAyZmY3MDc5MTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX2h3cHJvYmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
PiBAQCAtMTA4LDYgKzEwOCw4IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0
IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gICAgICAgICAgICAgICAgIEVYVF9LRVkoWkNCKTsKPiAg
ICAgICAgICAgICAgICAgRVhUX0tFWShaQ01PUCk7Cj4gICAgICAgICAgICAgICAgIEVYVF9LRVko
WklDQk9aKTsKPiArICAgICAgICAgICAgICAgRVhUX0tFWShaSUNGSUxQKTsKPiArICAgICAgICAg
ICAgICAgRVhUX0tFWShaSUNGSVNTKTsKPiAgICAgICAgICAgICAgICAgRVhUX0tFWShaSUNPTkQp
Owo+ICAgICAgICAgICAgICAgICBFWFRfS0VZKFpJSElOVE5UTCk7Cj4gICAgICAgICAgICAgICAg
IEVYVF9LRVkoWklISU5UUEFVU0UpOwo+CkxHVE0uCgpSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
