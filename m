Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807D2CED26B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 05:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E27Re7NhbJ14fNZbR1r+m7uns/kLm3MfpiXgxf4rjCk=; b=XBynQ7NH5w/P2B5zJiou5rQnEV
	exwyljFqZe3xBbchhUHEUgI92eubi8UJhmCMkKazwZdOe/QdJUCNo39iekYXXtkwmjHVGm6d2jn1/
	EH/M3i9tplODc6KaNOcEp9xOwIKNH38CmBoR/w/lpwZ7R/VPmDSliy1sK/EeXhQzNH9qbvxTDpShV
	9VKatvT4W0utT6VCBVCyZZmpdv0SGrJuK03eMQDdu4X+cyGJ2R0O+mcXRLorlUveN4XIApsWBDiQc
	pLKLhKrqE7JK85vLXJUhBT0Fyl3E0bwLduVLlcQ5aRCMzDtOdra4ODT9jzdSd30qEbmrVdatWuRC1
	t9iSOXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2oc-00000004YaZ-3uYG;
	Tue, 08 Oct 2024 05:31:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2oZ-00000004YZH-1c02
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 05:31:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c544d34bcso2651845ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728365478; x=1728970278; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YVWWt1mcV86CG5um5aUopa5TS6G5mg+pb0D64jrI0rI=;
        b=gtgv+10jCVJK7M0M/6IuT2T6B8LL1qXG53zhDB/4Zj4L41YUCVdJeXkyBUEBr10S8K
         GlZNJTh/mhFgpnBdK9eBfUPiXLyDDQ6eFcMK5BsPmEOfxEKlswWYuc9aOM5xPrK3KKjy
         h8OnAxmzAuv6+bnc5rEEhLJfL+eDkd5fT1lmdqA+Q9naAPvuJBGhroB0c/ziKJbECIqY
         rKZXCEtStKX63iji/EGqSiVU8CL8SmJWwBoyx188gBN6VmuprXG8N3xU4Cx2qoun+jam
         Pq6lw31I/hi3S6P+Tg2xLQySAZtOe5K2mdWKs6Cmf8Qi34ctUEms0T+bgUn/I3zE29Bw
         Dk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728365478; x=1728970278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVWWt1mcV86CG5um5aUopa5TS6G5mg+pb0D64jrI0rI=;
        b=YuWbPlbmo8w3ASjcuDBjOKCHQ5cWSDGu4mVT2/WBhyCMcrf4uwTrAyb5gwXtpagXPZ
         GFLfFrJNbzjxGTtDb8HnjpsqkT7vB3u2N7NpGbYN7TTig3vXmh3wP/nXkOo0+zTUuWmE
         bLdxa3rhxtBfiyQ5h56CJjAe+kctOguMBfnXg4D2AvuybbBtAwEiUYOKQEF+iaQb3SvO
         E7hmCl5ftqkFQ+m+np28mNXaIIMUD0eRJn933u0vWRVIHkPco8pMMkYNPeVmBqtzmKTs
         5OEct7texMNtvRzp81mr80HtrUdjch8NyW9LkLnyGPL9nyLwmKWPoK/daU/TIyFGKimh
         3KYw==
X-Forwarded-Encrypted: i=1; AJvYcCXi4fwbgF2+vgT7RPV9rdZakwFPlKLw/qAJM2XsgOQPdSinGsWH0g/bU4tOeuJ4/jdh+R1BCLX9kxkHOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOC9BuoUqDFykgx8BYbpNzKAJiAqJf90QhhCdPdwzxz0pMilQN
	QG9TQGDB6a3uP6RPofJIwr85Re08QG2Ss5xkf2TxF89ug9wQQdfSAvhEcu8ae0A=
X-Google-Smtp-Source: AGHT+IGthWcJ/4TKf5GSv621dnUUfPBgutAW7rucqDwxG39GX8eeue8mfmIeD0tAu25NcYxCwQyqlA==
X-Received: by 2002:a17:902:d4cd:b0:20b:7731:e3f8 with SMTP id d9443c01a7336-20bfe00b926mr216344355ad.26.1728365478346;
        Mon, 07 Oct 2024 22:31:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1393a292sm48470455ad.173.2024.10.07.22.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 22:31:18 -0700 (PDT)
Date: Mon, 7 Oct 2024 22:31:14 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH 16/33] riscv/shstk: If needed allocate a new shadow stack
 on clone
Message-ID: <ZwTDonkiATv999sS@debug.ba.rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-16-3ba65b6e550f@rivosinc.com>
 <CANXhq0rpwQkZ9+mZLGVUq=r4WiA8BbZ-eeTDogf3fzeEPqeeqA@mail.gmail.com>
 <ZwRvAEwFbrpq3zZq@debug.ba.rivosinc.com>
 <CANXhq0qaokjDC9hb75_dpGuyOd_ex8+q7YNe8pAg7dbTcxuLSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0qaokjDC9hb75_dpGuyOd_ex8+q7YNe8pAg7dbTcxuLSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_223119_743506_F04D9CE0 
X-CRM114-Status: GOOD (  30.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMDE6MTY6MTdQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgNzozMOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gT24gTW9uLCBPY3QgMDcsIDIwMjQgYXQgMDQ6MTc6NDdQ
TSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPj4gPk9uIFdlZCwgT2N0IDIsIDIwMjQgYXQgMTI6MjDi
gK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+
IFVzZXJzcGFjZSBzcGVjaWZpZXMgQ0xPTkVfVk0gdG8gc2hhcmUgYWRkcmVzcyBzcGFjZSBhbmQg
c3Bhd24gbmV3IHRocmVhZC4KPj4gPj4gYGNsb25lYCBhbGxvdyB1c2Vyc3BhY2UgdG8gc3BlY2lm
eSBhIG5ldyBzdGFjayBmb3IgbmV3IHRocmVhZC4gSG93ZXZlcgo+PiA+PiB0aGVyZSBpcyBubyB3
YXkgdG8gc3BlY2lmeSBuZXcgc2hhZG93IHN0YWNrIGJhc2UgYWRkcmVzcyB3aXRob3V0IGNoYW5n
aW5nCj4+ID4+IEFQSS4gVGhpcyBwYXRjaCBhbGxvY2F0ZXMgYSBuZXcgc2hhZG93IHN0YWNrIHdo
ZW5ldmVyIENMT05FX1ZNIGlzIGdpdmVuLgo+PiA+Pgo+PiA+PiBJbiBjYXNlIG9mIENMT05FX1ZG
T1JLLCBwYXJlbnQgaXMgc3VzcGVuZGVkIHVudGlsIGNoaWxkIGZpbmlzaGVzIGFuZCB0aHVzCj4+
ID4+IGNhbiBjaGlsZCB1c2UgcGFyZW50IHNoYWRvdyBzdGFjay4gSW4gY2FzZSBvZiAhQ0xPTkVf
Vk0sIENPVyBraWNrcyBpbgo+PiA+PiBiZWNhdXNlIGVudGlyZSBhZGRyZXNzIHNwYWNlIGlzIGNv
cGllZCBmcm9tIHBhcmVudCB0byBjaGlsZC4KPj4gPj4KPj4gPj4gYGNsb25lM2AgaXMgZXh0ZW5z
aWJsZSBhbmQgY2FuIHByb3ZpZGUgbWVjaGFuaXNtcyB1c2luZyB3aGljaCBzaGFkb3cgc3RhY2sK
Pj4gPj4gYXMgYW4gaW5wdXQgcGFyYW1ldGVyIGNhbiBiZSBwcm92aWRlZC4gVGhpcyBpcyBub3Qg
c2V0dGxlZCB5ZXQgYW5kIGJlaW5nCj4+ID4+IGV4dGVuc2l2ZWx5IGRpc2N1c3NlZCBvbiBtYWls
aW5nIGxpc3QuIE9uY2UgdGhhdCdzIHNldHRsZWQsIHRoaXMgY29tbWl0Cj4+ID4+IHdpbGwgYWRh
cHQgdG8gdGhhdC4KPj4gPj4KPj4gPj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1
Z0ByaXZvc2luYy5jb20+Cj4+ID4+IC0tLQo+PiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91
c2VyY2ZpLmggfCAgMjUgKysrKysrKysKPj4KPj4gLi4uIHNuaXBwZWQuLi4KPj4KPj4gPj4gKwo+
PiA+PiArLyoKPj4gPj4gKyAqIFRoaXMgZ2V0cyBjYWxsZWQgZHVyaW5nIGNsb25lL2Nsb25lMy9m
b3JrLiBBbmQgaXMgbmVlZGVkIHRvIGFsbG9jYXRlIGEgc2hhZG93IHN0YWNrIGZvcgo+PiA+PiAr
ICogY2FzZXMgd2hlcmUgQ0xPTkVfVk0gaXMgc3BlY2lmaWVkIGFuZCB0aHVzIGEgZGlmZmVyZW50
IHN0YWNrIGlzIHNwZWNpZmllZCBieSB1c2VyLiBXZQo+PiA+PiArICogdGh1cyBuZWVkIGEgc2Vw
YXJhdGUgc2hhZG93IHN0YWNrIHRvby4gSG93IGRvZXMgc2VwYXJhdGUgc2hhZG93IHN0YWNrIGlz
IHNwZWNpZmllZCBieQo+PiA+PiArICogdXNlciBpcyBzdGlsbCBiZWluZyBkZWJhdGVkLiBPbmNl
IHRoYXQncyBzZXR0bGVkLCByZW1vdmUgdGhpcyBwYXJ0IG9mIHRoZSBjb21tZW50Lgo+PiA+PiAr
ICogVGhpcyBmdW5jdGlvbiBzaW1wbHkgcmV0dXJucyAwIGlmIHNoYWRvdyBzdGFjayBhcmUgbm90
IHN1cHBvcnRlZCBvciBpZiBzZXBhcmF0ZSBzaGFkb3cKPj4gPj4gKyAqIHN0YWNrIGFsbG9jYXRp
b24gaXMgbm90IG5lZWRlZCAobGlrZSBpbiBjYXNlIG9mICFDTE9ORV9WTSkKPj4gPj4gKyAqLwo+
PiA+PiArdW5zaWduZWQgbG9uZyBzaHN0a19hbGxvY190aHJlYWRfc3RhY2soc3RydWN0IHRhc2tf
c3RydWN0ICp0c2ssCj4+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCj4+ID4+ICt7Cj4+ID4+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCBzaXplOwo+PiA+PiArCj4+ID4+ICsgICAgICAg
LyogSWYgc2hhZG93IHN0YWNrIGlzIG5vdCBzdXBwb3J0ZWQsIHJldHVybiAwICovCj4+ID4+ICsg
ICAgICAgaWYgKCFjcHVfc3VwcG9ydHNfc2hhZG93X3N0YWNrKCkpCj4+ID4+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPj4gPj4gKwo+PiA+PiArICAgICAgIC8qCj4+ID4+ICsgICAgICAgICog
SWYgc2hhZG93IHN0YWNrIGlzIG5vdCBlbmFibGVkIG9uIHRoZSBuZXcgdGhyZWFkLCBza2lwIGFu
eQo+PiA+PiArICAgICAgICAqIHN3aXRjaCB0byBhIG5ldyBzaGFkb3cgc3RhY2suCj4+ID4+ICsg
ICAgICAgICovCj4+ID4+ICsgICAgICAgaWYgKGlzX3Noc3RrX2VuYWJsZWQodHNrKSkKPj4gPgo+
PiA+SGkgRGVlcGFrLAo+PiA+U2hvdWxkIGl0IGJlICchJyBpc19zaHN0a19lbmFibGVkKHRzayk/
Cj4+Cj4+IFllcyBpdCBpcyBhIGJ1Zy4gSXQgc2VlbXMgbGlrZSBmb3JrIHdpdGhvdXQgQ0xPTkVf
Vk0gb3Igd2l0aCBDTE9ORV9WRk9SSywgaXQgd2FzIHJldHVybmluZwo+PiAwIGFueXdheXMuIEFu
ZCBpbiB0aGUgY2FzZSBvZiBDTE9ORV9WTSAodXNlZCBieSBwdGhyZWFkKSwgaXQgd2FzIG5vdCBk
b2luZyB0aGUgcmlnaHQgdGhpbmcuCj4KPkhpIERlZXBhaywKPkknZCBsaWtlIHRvIGtub3cgaWYg
SSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gQ291bGQgSSBrbm93IHdoZXRoZXIgdGhlcmUKPm1pZ2h0
IGFsc28gYmUgYSByaXNrIHdoZW4gdGhlIHVzZXIgcHJvZ3JhbSBkb2Vzbid0IGVuYWJsZSB0aGUg
Q0ZJIGFuZAo+dGhlIGtlcm5lbCBkb2Vzbid0IGFjdGl2YXRlIENGSS4gQmVjYXVzZSB0aGlzIGZs
b3cgd2lsbCBzdGlsbCB0cnkgdG8KPmFsbG9jYXRlIHRoZSBzaGFkb3cgc3RhY2sgYW5kIGV4ZWN1
dGUgdGhlIHNzYW1vd2FwIGNvbW1hbmQuIFRoYW5rcwoKYHNoc3RrX2FsbG9jX3RocmVhZF9zdGFj
a2AgaXMgb25seSBjYWxsZWQgZnJvbSBgY29weV90aHJlYWRgIGFuZCAgYWxsb2NhdGVzIGFuZApy
ZXR1cm5zIG5vbi16ZXJvIChwb3NpdGl2ZSB2YWx1ZSkgZm9yIHNzcCBvbmx5IGlmIGBDTE9ORV9W
TWAgaXMgc3BlY2lmaWVkLgpgQ0xPTkVfVk1gIG1lYW5zIHRoYXQgYWRkcmVzcyBzcGFjZSBpcyBz
aGFyZWQgYW5kIHVzZXJzcGFjZSBoYXMgYWxsb2NhdGVkCnNlcGFyYXRlIHN0YWNrLiBUaGlzIGZs
b3cgaXMgZW5zdXJpbmcgdGhhdCBuZXdseSBjcmVhdGVkIHRocmVhZCB3aXRoIHNlcGFyYXRlCmRh
dGEgc3RhY2sgZ2V0cyBhIHNlcGFyYXRlIHNoYWRvdyBzdGFjayBhcyB3ZWxsLgoKUmV0cnVuaW5n
IHplcm8gdmFsdWUgZnJvbSBgc2hzdGtfYWxsb2NfdGhyZWFkX3N0YWNrYCBtZWFucyB0aGF0LCBu
byBuZWVkIHRvCmFsbG9jYXRlIGEgc2hhZG93IHN0YWNrLiBJZiB5b3UgbG9vayBhdCBgY29weV90
aHJlYWRgIGZ1bmN0aW9uLCBpdCBzaW1wbHkgc2V0cwp0aGUgcmV0dXJuZWQgc3NwIGluIG5ld2x5
IGNyZWF0ZWQgdGFzaydzIHRhc2tfc3RydWN0IChpZiBpdCB3YXMgbm9uLXplcm8pLgpJZiByZXR1
cm5lZCBzc3Agd2FzIHplcm8sIGBjb3B5X3RocmVhZGAgZG9lc24ndCBkbyBhbnl0aGluZy4gVGh1
cyB3aGF0ZXZlciBpcwpjdXJyZW50IHRhc2sgc2V0dGluZ3MgYXJlIHRoYXQgd2lsbCBiZSBjb3Bp
ZWQgb3ZlciB0byBuZXcgZm9ya2VkL2Nsb25lZCB0YXNrLgpJZiBjdXJyZW50IHRhc2sgaGFkIHNo
YWRvdyBzdGFjayBlbmFibGVkLCBuZXcgdGFzayB3aWxsIGFsc28gZ2V0IGl0IGVuYWJsZWQgYXQK
c2FtZSBhZGRyZXNzICh0byBiZSBDT1dlZCBsYXRlcikuCgpBbnkgdGFzayBnZXQgc2hhZG93IHN0
YWNrIGVuYWJsZWQgZm9yIGZpcnN0IHRpbWUgdXNpbmcgbmV3IHByY3RscyAoc2VlIHByY3RsCnBh
dGNoZXMpLgoKU28gb25seSB0aW1lIGBzc2Ftb3N3YXBgIHdpbGwgYmUgZXhlcmNpc2VkIHdpbGwg
YmUgYXJlCi0gVXNlciBpc3N1ZXMgZW5hYmxpbmcgYHByY3RsYCAoaXQnbGwgYmUgaXNzdWVkIGZy
b20gbG9hZGVyKQotIGZvcmsvY2xvbmUgaGFwcGVucwoKSW4gYm90aCBjYXNlcywgaXQgaXMgZ3Vh
cmRlZCBhZ2FpbnN0IGNoZWNrcyBvZiB3aGV0aGVyIGNwdSBzdXBwb3J0cyBpdCBhbmQgdGFzawpo
YXMgc2hhZG93IHN0YWNrIGVuYWJsZWQuCgpMZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgSSBtaXNz
ZWQgYW55IGZsb3cuCgo+Cj4+IE1vc3Qgb2YgdGhlIHRlc3RpbmcgaGFzIGJlZW4gd2l0aCBidXN5
Ym94IGJ1aWxkIChpbmRlcGVuZGVudCBiaW5hcmllczAgZHJpdmVuIHZpYSBidWlsZHJvb3QKPj4g
c2V0dXAuIFdvbmRlcmluZyB3aHkgaXQgd2Fzbid0IGNhdWdodC4KPj4KPj4gQW55d2F5cywgd2ls
bCBmaXggaXQuIFRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQuCj4+Cj4+ID4KPj4gPj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+PiA+PiArCj4+ID4+ICsgICAgICAgLyoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
