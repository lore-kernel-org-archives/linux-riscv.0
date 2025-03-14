Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC95C35FF1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB3TELInPtYKBnaNabnJGaFhc67URKC0hwzLdannZPs=; b=4prj/BFNWkLhOl
	LFReB1j2uuMAz5YlCrPvXv9qcN8r+J4ffQIR9Rtwex/fqf6/MEMkrjy/skBr/Cv2ly5jiWY0MoFsd
	+pLHiaKkWdJfNjxtUoYt8Xmgryq9rF+1Iqt0JofJLrVlHL9tqDWrkAA9zv+KdoQmggvc8jq80hsN3
	XRvV0h1DTqK44QownhK/yEDqwysnADD2+hf1TVPlqpQ19MZCRjz7J8G7ey6xLjq60j2C52mQ1zhZk
	NAzgP/m3BFzrHQiUXOk/X0K325G53e/CvkQHpeAnHLem2AKkBC+KGxyuYl8rJfHYDwvsfa12u1O3E
	OnmXaImj3iMk1SEbvQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lD-0000000DXEg-35z1;
	Fri, 14 Mar 2025 08:51:19 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0P6-0000000DSsD-3BTV
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:28:30 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso17117905ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940908; x=1742545708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfQM28N9JPXsaVfg+1fZcj0o7z6iPxTVilM1OHygPAA=;
        b=QOqizhTIiwpA0jy3iiXYTvBV843J5Od+ydTh6uA3u0qfqUWrEieji03hoyX71unuw0
         ZWlhghe54YU7Ivsem5gvefcTT2f5hQ5Hgulv8ieUjr1HSz0+k956FZFQfxphK0FeaWIv
         eEVBVZ6zMDxu9mf7ZMyxy7If142tXqVJ4mvFffO6T52sAZE3GIjWa84/HaLm1z5jth4O
         1cYoH4wtZH0QbQo/lEMdp8VkTZbcCKTjNGgS2PvXi9Grz/lNSgPDdtzElhcEHJHkQwvi
         jmrkHiCMT1UWfuaDTytabifP8nUNWa3T7YCjV0Y8B45S6FL9wi8uUuM5IkbpX3rmqCyw
         LQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940908; x=1742545708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfQM28N9JPXsaVfg+1fZcj0o7z6iPxTVilM1OHygPAA=;
        b=KYflPIHtJtNLgZqELLuRTw3VTydhj2EWRoH1ApDsV2J+FdgkpggdRUil9oiRHd5f+C
         WRGdraJr0n5KinHSSyPn/fs4mQXSiFQkhjSApZEC4HYahg+aR9868BbtZa7kPN+41alu
         PeA3x6dVgQBjKu7N4UA7mi/t9by19Nr+bLnhg687bwQLgnfcGHzcxQhEiaWfHR4Yv2Do
         NqJHP3tLdu9hKqOEB9qNvXclPBXJsgThSHoFNAP5aYFpR6IMDT09OWLQRmd0fzDlC/CJ
         FcZA8nePWGstzpCyZ6LmoboZ/T/RPp7X2eNuYWhe0/SJm0y3cQMQpakz8qwA+fV31wIN
         Swew==
X-Forwarded-Encrypted: i=1; AJvYcCXfD7IA3nRvFuGyCoyDLJ5A/yo4Wz+vFUk4IHZkT81kMeZSlCfd+nSQrgfNW6uC22MLzdK8VHtcboP6Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0UUY1CygKbGshOISFQwF9HAmvff36+3PnektVL5MBFWtBTxBG
	ilxWa8UD4+Qep0yRr61na/pnnsM8L4+zqNOuGGV04MEbdbNuOg0cAjL1Gz6ENwHq7lInu8Kn9My
	Py3pPY1dOZorC0neCsKkkO1wEZfi0/O39eoze8A==
X-Gm-Gg: ASbGncslTDobwtKxfiWv1DHYLX9jwOSqh4uik3ryJOiVurh8PlKJogyaUQCH34mBIGg
	WXCId/5y35TiuztEKSofujr/MSOQjSrOPFKEGMV+M3AT/jUnu9hKsqvZiXVZMwKz7L0NWH6Cy8r
	tMwmIj92Ir6WB868MaIvFKOC6re5Sg3BOfYK5/+A==
X-Google-Smtp-Source: AGHT+IEus2eidY5ho/u8kwK0lJdtjoMJ6hhBelcGc2gZ6mBgkM87bHEv8OtdPq4kzNbtkzqAYGzl75buC/L6OC0Zx7w=
X-Received: by 2002:a05:6e02:338b:b0:3d4:3fed:81f7 with SMTP id
 e9e14a558f8ab-3d483a76c70mr14609815ab.19.1741940907731; Fri, 14 Mar 2025
 01:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-5-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-5-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:28:16 +0800
X-Gm-Features: AQ5f1JpDAK-Wh3zbs_fniZz3O3lKSiSx95v5vbF1bDBIyMbqDELLA2snuSUHWWE
Message-ID: <CANXhq0pdUPu4eDSJDGpjz804hY3ZsjLCOvyTuKDYajqzT0Xw+w@mail.gmail.com>
Subject: Re: [PATCH v11 05/27] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
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
X-CRM114-CacheID: sfid-20250314_012828_809350_4AA5C91E 
X-CRM114-Status: GOOD (  31.68  )
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
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBDYXJ2ZXMgb3V0IHNwYWNlIGluIGFyY2ggc3BlY2lmaWMg
dGhyZWFkIHN0cnVjdCBmb3IgY2ZpIHN0YXR1cyBhbmQgc2hhZG93Cj4gc3RhY2sgaW4gdXNlcm1v
ZGUgb24gcmlzY3YuCj4KPiBUaGlzIHBhdGNoIGRvZXMgZm9sbG93aW5nCj4gLSBkZWZpbmVzIGEg
bmV3IHN0cnVjdHVyZSBjZmlfc3RhdHVzIHdpdGggc3RhdHVzIGJpdCBmb3IgY2ZpIGZlYXR1cmUK
PiAtIGRlZmluZXMgc2hhZG93IHN0YWNrIHBvaW50ZXIsIGJhc2UgYW5kIHNpemUgaW4gY2ZpX3N0
YXR1cyBzdHJ1Y3R1cmUKPiAtIGRlZmluZXMgb2Zmc2V0cyB0byBuZXcgbWVtYmVyIGZpZWxkcyBp
biB0aHJlYWQgaW4gYXNtLW9mZnNldHMuYwo+IC0gU2F2ZXMgYW5kIHJlc3RvcmUgc2hhZG93IHN0
YWNrIHBvaW50ZXIgb24gdHJhcCBlbnRyeSAoVSAtLT4gUykgYW5kIGV4aXQKPiAgIChTIC0tPiBV
KQo+Cj4gU2hhZG93IHN0YWNrIHNhdmUvcmVzdG9yZSBpcyBnYXRlZCBvbiBmZWF0dXJlIGF2YWls
aWJsaXR5IGFuZCBpbXBsZW1lbnRlZAo+IHVzaW5nIGFsdGVybmF0aXZlLiBDU1IgY2FuIGJlIGNv
bnRleHQgc3dpdGNoZWQgaW4gYHN3aXRjaF90b2AgYXMgd2VsbCBidXQKPiBzb29uIGFzIGtlcm5l
bCBzaGFkb3cgc3RhY2sgc3VwcG9ydCBnZXRzIHJvbGxlZCBpbiwgc2hhZG93IHN0YWNrIHBvaW50
ZXIKPiB3aWxsIG5lZWQgdG8gYmUgc3dpdGNoZWQgYXQgdHJhcCBlbnRyeS9leGl0IHBvaW50ICht
dWNoIGxpa2UgYHNwYCkuIEl0IGNhbgo+IGJlIGFyZ3VlZCB0aGF0IGtlcm5lbCB1c2luZyBzaGFk
b3cgc3RhY2sgZGVwbG95bWVudCBzY2VuYXJpbyBtYXkgbm90IGJlIGFzCj4gcHJldmFsYW50IGFz
IHVzZXIgbW9kZSB1c2luZyB0aGlzIGZlYXR1cmUuIEJ1dCBldmVuIGlmIHRoZXJlIGlzIHNvbWUK
PiBtaW5pbWFsIGRlcGxveW1lbnQgb2Yga2VybmVsIHNoYWRvdyBzdGFjaywgdGhhdCBtZWFucyB0
aGF0IGl0IG5lZWRzIHRvIGJlCj4gc3VwcG9ydGVkLiBBbmQgdGh1cyBzYXZlL3Jlc3RvcmUgb2Yg
c2hhZG93IHN0YWNrIHBvaW50ZXIgaW4gZW50cnkuUyBpbnN0ZWFkCj4gb2YgaW4gYHN3aXRjaF90
by5oYC4KPgo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29t
Pgo+IFJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgMSArCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysK
PiAgYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgIHwgIDQgKysrKwo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaAo+IGluZGV4IGUzYWJhMzMzNmU2My4uZDg1MWJiNWM2ZGEwIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gQEAgLTE0LDYgKzE0LDcgQEAKPgo+
ICAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gKyNp
bmNsdWRlIDxhc20vdXNlcmNmaS5oPgo+Cj4gICNkZWZpbmUgYXJjaF9nZXRfbW1hcF9lbmQoYWRk
ciwgbGVuLCBmbGFncykgICAgICAgICAgICAgICAgICAgIFwKPiAgKHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBpbmRleCBmNTkxNmE3MDg3OWEuLmEwY2ZlMDBjMmNh
NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBAQCAtNjIsNiArNjIs
OSBAQCBzdHJ1Y3QgdGhyZWFkX2luZm8gewo+ICAgICAgICAgbG9uZyAgICAgICAgICAgICAgICAg
ICAgdXNlcl9zcDsgICAgICAgIC8qIFVzZXIgc3RhY2sgcG9pbnRlciAqLwo+ICAgICAgICAgaW50
ICAgICAgICAgICAgICAgICAgICAgY3B1Owo+ICAgICAgICAgdW5zaWduZWQgbG9uZyAgICAgICAg
ICAgc3lzY2FsbF93b3JrOyAgIC8qIFNZU0NBTExfV09SS18gZmxhZ3MgKi8KPiArI2lmZGVmIENP
TkZJR19SSVNDVl9VU0VSX0NGSQo+ICsgICAgICAgc3RydWN0IGNmaV9zdGF0dXMgICAgICAgdXNl
cl9jZmlfc3RhdGU7Cj4gKyNlbmRpZgo+ICAjaWZkZWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNL
Cj4gICAgICAgICB2b2lkICAgICAgICAgICAgICAgICAgICAqc2NzX2Jhc2U7Cj4gICAgICAgICB2
b2lkICAgICAgICAgICAgICAgICAgICAqc2NzX3NwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5o
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjVmMjAyN2M1MTkx
Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmku
aAo+IEBAIC0wLDAgKzEsMjQgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKPiArICogQ29weXJpZ2h0IChDKSAyMDI0IFJpdm9zLCBJbmMuCj4gKyAqIERlZXBhayBHdXB0
YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+ICsgKi8KPiArI2lmbmRlZiBfQVNNX1JJU0NWX1VTRVJD
RklfSAo+ICsjZGVmaW5lIF9BU01fUklTQ1ZfVVNFUkNGSV9ICj4gKwo+ICsjaWZuZGVmIF9fQVNT
RU1CTFlfXwo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiArCj4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfVVNFUl9DRkkKPiArc3RydWN0IGNmaV9zdGF0dXMgewo+ICsgICAgICAgdW5zaWduZWQg
bG9uZyB1YmNmaV9lbiA6IDE7IC8qIEVuYWJsZSBmb3IgYmFja3dhcmQgY2ZpLiAqLwo+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyByc3ZkIDogKChzaXplb2YodW5zaWduZWQgbG9uZykgKiA4KSAtIDEp
Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB1c2VyX3NoZHdfc3RrOyAvKiBDdXJyZW50IHVzZXIg
c2hhZG93IHN0YWNrIHBvaW50ZXIgKi8KPiArICAgICAgIHVuc2lnbmVkIGxvbmcgc2hkd19zdGtf
YmFzZTsgLyogQmFzZSBhZGRyZXNzIG9mIHNoYWRvdyBzdGFjayAqLwo+ICsgICAgICAgdW5zaWdu
ZWQgbG9uZyBzaGR3X3N0a19zaXplOyAvKiBzaXplIG9mIHNoYWRvdyBzdGFjayAqLwo+ICt9Owo+
ICsKPiArI2VuZGlmIC8qIENPTkZJR19SSVNDVl9VU0VSX0NGSSAqLwo+ICsKPiArI2VuZGlmIC8q
IF9fQVNTRU1CTFlfXyAqLwo+ICsKPiArI2VuZGlmIC8qIF9BU01fUklTQ1ZfVVNFUkNGSV9IICov
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCj4gaW5kZXggZTg5NDU1YTZhMGU1Li4wYzE4OGFhZjM5
MjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiBAQCAtNTAsNiArNTAsMTAgQEAgdm9p
ZCBhc21fb2Zmc2V0cyh2b2lkKQo+ICAjZW5kaWYKPgo+ICAgICAgICAgT0ZGU0VUKFRBU0tfVElf
Q1BVX05VTSwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmNwdSk7Cj4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfVVNFUl9DRkkKPiArICAgICAgIE9GRlNFVChUQVNLX1RJX0NGSV9TVEFUVVMsIHRhc2tf
c3RydWN0LCB0aHJlYWRfaW5mby51c2VyX2NmaV9zdGF0ZSk7Cj4gKyAgICAgICBPRkZTRVQoVEFT
S19USV9VU0VSX1NTUCwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLnVzZXJfY2ZpX3N0YXRlLnVz
ZXJfc2hkd19zdGspOwo+ICsjZW5kaWYKPiAgICAgICAgIE9GRlNFVChUQVNLX1RIUkVBRF9GMCwg
IHRhc2tfc3RydWN0LCB0aHJlYWQuZnN0YXRlLmZbMF0pOwo+ICAgICAgICAgT0ZGU0VUKFRBU0tf
VEhSRUFEX0YxLCAgdGFza19zdHJ1Y3QsIHRocmVhZC5mc3RhdGUuZlsxXSk7Cj4gICAgICAgICBP
RkZTRVQoVEFTS19USFJFQURfRjIsICB0YXNrX3N0cnVjdCwgdGhyZWFkLmZzdGF0ZS5mWzJdKTsK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2VudHJ5LlMKPiBpbmRleCAzM2E1YTlmMmEwZDQuLjY4Yzk5MTI0ZWE1NSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUwo+IEBAIC0xNDcsNiArMTQ3LDIwIEBAIFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9leGNl
cHRpb24pCj4KPiAgICAgICAgIFJFR19MIHMwLCBUQVNLX1RJX1VTRVJfU1AodHApCj4gICAgICAg
ICBjc3JyYyBzMSwgQ1NSX1NUQVRVUywgdDAKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBJZiBw
cmV2aW91cyBtb2RlIHdhcyBVLCBjYXB0dXJlIHNoYWRvdyBzdGFjayBwb2ludGVyIGFuZCBzYXZl
IGl0IGF3YXkKPiArICAgICAgICAqIFplcm8gQ1NSX1NTUCBhdCB0aGUgc2FtZSB0aW1lIGZvciBz
YW5pdGl6YXRpb24uCj4gKyAgICAgICAgKi8KPiArICAgICAgIEFMVEVSTkFUSVZFKCJub3A7IG5v
cDsgbm9wOyBub3AiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19zdHJpbmdp
ZnkoICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhbmRpIHMyLCBzMSwgU1JfU1BQOyAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBibmV6IHMyLCBza2lwX3NzcF9zYXZlOyBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjc3JydyBzMiwgQ1NSX1NTUCwgeDA7ICBcCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBSRUdfUyBzMiwgVEFTS19USV9VU0VSX1NTUCh0cCk7IFwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNraXBfc3NwX3NhdmU6KSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVND
Vl9JU0FfRVhUX1pJQ0ZJU1MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDT05G
SUdfUklTQ1ZfVVNFUl9DRkkpCj4gICAgICAgICBjc3JyIHMyLCBDU1JfRVBDCj4gICAgICAgICBj
c3JyIHMzLCBDU1JfVFZBTAo+ICAgICAgICAgY3NyciBzNCwgQ1NSX0NBVVNFCj4gQEAgLTIzNiw2
ICsyNTAsMTggQEAgU1lNX0NPREVfU1RBUlRfTk9BTElHTihyZXRfZnJvbV9leGNlcHRpb24pCj4g
ICAgICAgICAgKiBzdHJ1Y3R1cmVzIGFnYWluLgo+ICAgICAgICAgICovCj4gICAgICAgICBjc3J3
IENTUl9TQ1JBVENILCB0cAo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBHb2luZyBiYWNr
IHRvIFUgbW9kZSwgcmVzdG9yZSBzaGFkb3cgc3RhY2sgcG9pbnRlcgo+ICsgICAgICAgICovCj4g
KyAgICAgICBBTFRFUk5BVElWRSgibm9wOyBub3AiLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgX19zdHJpbmdpZnkoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkVHX0wgczMsIFRBU0tfVElfVVNF
Ul9TU1AodHApOyBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjc3J3IENTUl9T
U1AsIHMzKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBDT05GSUdfUklTQ1ZfVVNFUl9DRkkpCj4gKwo+ICAxOgo+
ICAjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9WX1BSRUVNUFRJVkUKPiAgICAgICAgIG1vdmUgYTAs
IHNwCj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgoK
PiAtLQo+IDIuMzQuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
