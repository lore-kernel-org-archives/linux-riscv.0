Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DD8C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5CZ7SwQRsKVa0fXFegIaVagQUODwL53YlmZ3WdpGH0=; b=dKR+UbCBSLRUVY
	lOCCjcHpmBsaySN9lwAD/IQPJTr6kVX4mqeQktVB3gnYFuU94ZlPFayqsKKIXC5vjDOGvPPrecq1y
	4R1LsOR1WUesVmUZCf2ctfph1jBUGorC4axEayH91Eqq4XUadH1jn9108Q9HE7AuWQ4lmmuwieaFX
	QUkrrySm/P5i/+Frtuh2ZTDW3cs9l8rN4rUZsFMOM7R77TE/RLXzKIRoB5D0MhxfClWvbPsoajWJu
	6wjxJSEWaM52khHkv7uDN2pk9tq5oMMTjtBMww8KAHCRCjMowwYZuVq33UMaq47ZWNDV2SYAf888W
	g71AMIJ+JjJic0fSfsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNkY-00E9MY-0v;
	Thu, 04 Jan 2024 13:27:06 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNkU-00E9KT-30
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 13:27:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55569b59f81so615510a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 05:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704374819; x=1704979619; darn=lists.infradead.org;
        h=content-transfer-encoding:to:references:message-id:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NLOEEKOHl1K8SwVg4x8l8DROTucqom/M/VF0VUr2O4=;
        b=f9BIioOOgR1OnKCp+Ipt/j7WersEjMpge6//Y13OyKccYp4KZHC6k7seUuRXSpQEUP
         ZPHQaKxkDDmNoyYN8o5k2Iq41vQ9sbLyr1Hwch6jrJTEJBxdSvMnqM5TB6O1qHmUiCyE
         CCs6Kaew/HuobX5aNR7XkfSOfa7f4mEfyIiGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704374819; x=1704979619;
        h=content-transfer-encoding:to:references:message-id:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NLOEEKOHl1K8SwVg4x8l8DROTucqom/M/VF0VUr2O4=;
        b=kJAlcpBCShLOmylYpSQENwSkHQpd7tC7AA2HAxi+lOpRHD2G3eyvdzFkjb4Rl8xjr6
         /k3iaj5klakoYOX3pH99qB7jDxBCPv3QJLsZsMBfr58GDGGnub9jxa7L+0rWl7TvUxo+
         ym4VKkpot60JfwyrpoHhOSZqvqA3f1vNnikToF5d6pRq3jrm+o8fHbWDrkU8MtB6DHIf
         kX0xHO74WhDEIqKX4Kx0WkRVoGqMbwtOVdJR17G137cz7F9xBy41EXh1HMFQHG6cPPkd
         Wyq8/vilQDTaVJ4RgnhqYRvTjhNZ31Yu9SQYM9aucpIkGpAxo3xghU5OJy1LDNksHslT
         F98w==
X-Gm-Message-State: AOJu0Yy1w8JZi10SSnC+jkj+bLyNYhT1QDmQc6RgmSRGFxPq2c9DVuca
	hNU+NUJhApcBK6c0rjb0KSy0NuvzUTxNA/KFUODP7z7glw1HxHQe0np7f0t6PDCa772/dYzDeZ1
	yG9N25cyEqjyCPv3QDL5QdRyqKA==
X-Google-Smtp-Source: AGHT+IHd/WpwPLyNONTm9ogjAA99SQMYsTaEZ3qlb+1RX3wQIK/T9BGDoHBAKS8TMe2iuAmaxN1MUA==
X-Received: by 2002:a50:c35d:0:b0:557:183b:9028 with SMTP id q29-20020a50c35d000000b00557183b9028mr8478edb.65.1704374819165;
        Thu, 04 Jan 2024 05:26:59 -0800 (PST)
Received: from smtpclient.apple ([132.69.236.92])
        by smtp.gmail.com with ESMTPSA id ef7-20020a05640228c700b00556cf2545desm2249504edb.16.2024.01.04.05.26.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jan 2024 05:26:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH 1/2] mm/tlb: fix fullmm semantics
From: Nadav Amit <nadav.amit@broadcom.com>
In-Reply-To: <ZZN35DTJTNExCNXW@xhacker>
Date: Thu, 4 Jan 2024 15:26:43 +0200
Cc: Will Deacon <will@kernel.org>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 Nadav Amit <namit@vmware.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Yu Zhao <yuzhao@google.com>,
 the arch/x86 maintainers <x86@kernel.org>
Message-Id: <0468E994-273E-4A8B-A521-150723DA9774@broadcom.com>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
 <204B6410-2EFA-462B-9DF7-64CC5F1D3AD2@broadcom.com>
 <ZZN35DTJTNExCNXW@xhacker>
To: Jisheng Zhang <jszhang@kernel.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_052702_971305_FE470560 
X-CRM114-Status: GOOD (  20.16  )
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

Cgo+IE9uIEphbiAyLCAyMDI0LCBhdCA0OjQx4oCvQU0sIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gT24gU2F0LCBEZWMgMzAsIDIwMjMgYXQgMTE6NTQ6MDJB
TSArMDIwMCwgTmFkYXYgQW1pdCB3cm90ZToKPiAKPj4gCj4+IE15IGtub3dsZWRnZSBvZiBhcm02
NCBpcyBhIGJpdCBsaW1pdGVkLCBidXQgdGhlIGNvZGUgZG9lcyBub3Qgc2VlbQo+PiB0byBtYXRj
aCB0aGUgY29tbWVudCwgc28gaWYgaXQgaXMgY29ycmVjdCAod2hpY2ggSSBzdHJvbmdseSBkb3Vi
dCksCj4+IHRoZSBjb21tZW50IHNob3VsZCBiZSB1cGRhdGVkLgo+IAo+IHdpbGwgZG8gaWYgdGhl
IGFib3ZlIGNoYW5nZSBpcyBhY2NlcHRlZCBieSBhcm02NAoKSmlzaGVuZywgSSBleHBlY3RlZCBz
b21lYm9keSB3aXRoIGFybTY0IGtub3dsZWRnZSB0byBwb2ludCBpdCBvdXQsIGFuZAptYXliZSBJ
IGFtIHdyb25nLCBidXQgSSByZWFsbHkgZG9u4oCZdCB1bmRlcnN0YW5kIHNvbWV0aGluZyBhYm91
dCB0aGUKY29ycmVjdG5lc3MsIGlmIHlvdSBjYW4gcGxlYXNlIGV4cGxhaW4uCgpJbiB0aGUgZm9s
bG93aW5nIGNvZGU6CgotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RsYi5oCisrKyBiL2Fy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vdGxiLmgKQEAgLTYyLDcgKzYyLDEwIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB0bGJfZmx1c2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYikKCSAqIGludmFsaWRhdGlu
ZyB0aGUgd2Fsay1jYWNoZSwgc2luY2UgdGhlIEFTSUQgYWxsb2NhdG9yIHdvbid0CgkgKiByZWFs
bG9jYXRlIG91ciBBU0lEIHdpdGhvdXQgaW52YWxpZGF0aW5nIHRoZSBlbnRpcmUgVExCLgoJICov
Ci0JaWYgKHRsYi0+ZnVsbG1tKSB7CisJaWYgKHRsYi0+ZnVsbG1tKQorCQlyZXR1cm47CgpZb3Ug
c2tpcCBmbHVzaCBpZiBmdWxsbW0gaXMgb24uIEJ1dCBpZiBwYWdlLXRhYmxlcyBhcmUgZnJlZWQs
IHlvdSBtYXkKd2FudCB0byBmbHVzaCBpbW1lZGlhdGVseSBhbmQgbm90IHdhaXQgZm9yIEFTSUQg
dG8gYmUgZnJlZWQgdG8gYXZvaWQKc3BlY3VsYXRpdmUgcGFnZSB3YWxrczsgdGhlc2Ugd2Fsa3Mg
YXQgbGVhc3Qgb24geDg2IGNhdXNlZCBhIG1lc3MuCgpObz8KCgotLSAKVGhpcyBlbGVjdHJvbmlj
IGNvbW11bmljYXRpb24gYW5kIHRoZSBpbmZvcm1hdGlvbiBhbmQgYW55IGZpbGVzIHRyYW5zbWl0
dGVkIAp3aXRoIGl0LCBvciBhdHRhY2hlZCB0byBpdCwgYXJlIGNvbmZpZGVudGlhbCBhbmQgYXJl
IGludGVuZGVkIHNvbGVseSBmb3IgCnRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5
IHRvIHdob20gaXQgaXMgYWRkcmVzc2VkIGFuZCBtYXkgY29udGFpbiAKaW5mb3JtYXRpb24gdGhh
dCBpcyBjb25maWRlbnRpYWwsIGxlZ2FsbHkgcHJpdmlsZWdlZCwgcHJvdGVjdGVkIGJ5IHByaXZh
Y3kgCmxhd3MsIG9yIG90aGVyd2lzZSByZXN0cmljdGVkIGZyb20gZGlzY2xvc3VyZSB0byBhbnlv
bmUgZWxzZS4gSWYgeW91IGFyZSAKbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb3IgdGhlIHBl
cnNvbiByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0aGUgCmUtbWFpbCB0byB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50LCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFueSB1c2UsIApjb3B5
aW5nLCBkaXN0cmlidXRpbmcsIGRpc3NlbWluYXRpb24sIGZvcndhcmRpbmcsIHByaW50aW5nLCBv
ciBjb3B5aW5nIG9mIAp0aGlzIGUtbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3Ug
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIApwbGVhc2UgcmV0dXJuIHRoZSBlLW1haWwg
dG8gdGhlIHNlbmRlciwgZGVsZXRlIGl0IGZyb20geW91ciBjb21wdXRlciwgYW5kIApkZXN0cm95
IGFueSBwcmludGVkIGNvcHkgb2YgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
