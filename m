Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BC5C30653
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IDjs9NgzsZo/oZM/iPW9PrrpFtbEdsIgbS7DgV/yCM=; b=DKsbmXbZsX1w8/
	TeLRMXAhGFYNC1GcbviUK9OYxdRzszqdM1lbSwOJ3fsFawuF7lDV0J8m6cwgZ837+DPt0ThpSDkXh
	74vgy3LWvixKaFVlVb2kfVLvPBqvJhwIhiW4qxJ1Z7XZuTbbNKcAzh6mfnkfhxegWKKnMHWaj8l/3
	CC9Ao72zrn9KoawEhUc9zGrI2XbzM6arBG550DOkeOoKKFEYEWYChoqk6LnTY/9+nzs6ILigAISVI
	LqIUwf2z4Bbm5vKHOk+KDlybGDwxOWPxnM1XTh/+ZYbRdzBqFClmG1J7Q1i26AVYyn9Eoh3D64wN3
	dKuGbbRuF8KFw/+Mh5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQSyC-00000001sAZ-0oE3;
	Sun, 07 Jul 2024 14:34:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQSy7-00000001s9h-3F4p
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 14:34:27 +0000
Date: Sun, 7 Jul 2024 16:34:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720362858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QT/JZYImBb6WANX1g7RQzC4oQ/TM5mv6H1+ZAVtcEXg=;
	b=XrMFgfi5+bmf2zFPnd/QIDWbDG4J9yVFcVeEfPFcGD2V4UOZ5ewOMdbVTHJblauCULN9Hb
	Z6m0AJLk0GWA4EVRGXXghlSQIzpCn4/o2i4ipiSbghedsxff4yPEI0b/esgvatT+A22uE4
	8w7tTDSwhaOphu6075MGsB/4iPHa4q7rxdQOFqZvM0O5Eqnn4cdptR3tjJWbcofNUHUw6z
	ZdFb//XUubzTHCc0StsOtP/zX7EW6ouxO3ef3jFi9kwwn0uGdZLGO+OJuQgYygrOJ98APw
	UUxzMePNtAty/VrAEMPjsI5oPTqkcEdTQASoupUBlOEg0fgahzXpwnRl94QcdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720362858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QT/JZYImBb6WANX1g7RQzC4oQ/TM5mv6H1+ZAVtcEXg=;
	b=jLwhdt4P8vKkACKriOoBEVzOi4lnMiuf/wQLdPJZvmPN6T0VcKicgoqEPBoQvXE+Ew85ut
	9P7j3KfvcOFFCsBQ==
From: Nam Cao <namcao@linutronix.de>
To: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	b.spranger@linutronix.de, Christoph Hellwig <hch@lst.de>,
	Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Fix plic_set_affinity() only
 enables 1 cpu
Message-ID: <20240707143414.0ydME30F@linutronix.de>
References: <20240703072659.1427616-1-namcao@linutronix.de>
 <CAAhSdy0ZGD-p0iBVPqHF0RKTwvAAMWwYZ0ufioRrO75JzSh1qQ@mail.gmail.com>
 <20240703123327.CvOiP2Jb@linutronix.de>
 <CAAhSdy3gZHnSwovxypY5vP438TNPj8h+miqtyBKhEUAdWj=htQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3gZHnSwovxypY5vP438TNPj8h+miqtyBKhEUAdWj=htQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_073424_015634_8A80116A 
X-CRM114-Status: GOOD (  26.88  )
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

T24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMDg6MzE6MzFQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIEp1bCAzLCAyMDI0IGF0IDY6MDPigK9QTSBOYW0gQ2FvIDxuYW1jYW9AbGlu
dXRyb25peC5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMDU6Mjg6
MjNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gT24gV2VkLCBKdWwgMywgMjAyNCBh
dCAxMjo1N+KAr1BNIE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+IHBsaWNfc2V0X2FmZmluaXR5KCkgb25seSBlbmFibGVzIGludGVycnVwdCBmb3Ig
dGhlIGZpcnN0IHBvc3NpYmxlIENQVSBpbgo+ID4gPiA+IHRoZSBtYXNrLiBUaGUgcG9pbnQgaXMg
dG8gcHJldmVudCBhbGwgQ1BVcyB0cnlpbmcgdG8gY2xhaW0gYW4gaW50ZXJydXB0LAo+ID4gPiA+
IGJ1dCBvbmx5IG9uZSBDUFUgc3VjY2VlZHMgYW5kIHRoZSBvdGhlciBDUFVzIHdhc3RlZCBzb21l
IGNsb2NrIGN5Y2xlcyBmb3IKPiA+ID4gPiBub3RoaW5nLgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZl
ciwgdGhlcmUgYXJlIHR3byBwcm9ibGVtcyB3aXRoIHRoYXQ6Cj4gPiA+ID4gMS4gVXNlcnMgY2Fu
bm90IGVuYWJsZSBpbnRlcnJ1cHQgb24gbXVsdGlwbGUgQ1BVcyAoZm9yIGV4YW1wbGUsIHRvIG1p
bmltaXplCj4gPiA+ID4gaW50ZXJydXB0IGxhdGVuY3kpLgo+ID4gPgo+ID4gPiBXZWxsLCB5b3Ug
YXJlIGFzc3VtaW5nIHRoYXQgbXVsdGlwbGUgQ1BVcyBhcmUgYWx3YXlzIGlkbGUgb3IgYXZhaWxh
YmxlCj4gPiA+IHRvIHByb2Nlc3MgaW50ZXJydXB0cy4gSW4gb3RoZXIgd29yZHMsIGlmIHRoZSBz
eXN0ZW0gaXMgbG9hZGVkIHJ1bm5pbmcKPiA+ID4gc29tZSB3b3JrbG9hZCBvbiBlYWNoIENQVSB0
aGVuIHBlcmZvcm1hbmNlIG9uIG11bHRpcGxlIENQVXMKPiA+ID4gd2lsbCBkZWdyYWRlIHNpbmNl
IG11bHRpcGxlIENQVXMgd2lsbCB3YXN0ZWZ1bGx5IHRyeSB0byBjbGFpbSBpbnRlcnJ1cHQuCj4g
PiA+Cj4gPiA+IEluIHJlYWxpdHksIHdlIGNhbid0IG1ha2Ugc3VjaCBhc3N1bXB0aW9ucyBhbmQg
aXQgaXMgYmV0dGVyIHRvIHRhcmdldCBhCj4gPiA+IHBhcnRpY3VsYXIgQ1BVIGZvciBwcm9jZXNz
aW5nIGludGVycnVwdHMgKGp1c3QgbGlrZSB2YXJpb3VzIG90aGVyIGludGVycnVwdAo+ID4gPiBj
b250cm9sbGVycykuIEZvciBiYWxhbmNpbmcgaW50ZXJydXB0IHByb2Nlc3NpbmcgbG9hZCwgd2Ug
aGF2ZSBzb2Z0d2FyZQo+ID4gPiBpcnEgYmFsYW5jZXJzIHJ1bm5pbmcgaW4gdXNlci1zcGFjZSAo
b3Iga2VybmVsIHNwYWNlKSB3aGljaCBkbyBhCj4gPiA+IHJlYXNvbmFibHkgZmluZSBqb2Igb2Yg
cGlja2luZyBhcHByb3ByaWF0ZSBDUFUgZm9yIGludGVycnVwdCBwcm9jZXNzaW5nLgo+ID4KPiA+
IFRoZW4gd2Ugc2hvdWxkIGxlYXZlIHRoZSBqb2Igb2YgZGlzdHJpYnV0aW5nIGludGVycnVwdHMg
dG8gdGhvc2UgdG9vbHMsCj4gPiByaWdodD8gTm90IGFsbCB1c2UgY2FzZXMgd2FudCBtaW5pbWFs
bHkgd2FzdGVkIENQVSBjeWNsZXMuIEZvciBleGFtcGxlLCBpZgo+ID4gYSBwYXJ0aWN1bGFyIGlu
dGVycnVwdCBkb2VzIG5vdCBhcnJpdmUgdmVyeSBvZnRlbiwgYnV0IHdoZW4gaXQgZG9lcywgaXQK
PiA+IG5lZWRzIHRvIGJlIGhhbmRsZWQgZmFzdDsgaW4gdGhpcyBleGFtcGxlLCBjbGVhcmx5IGVu
YWJsaW5nIHRoaXMgaW50ZXJydXB0Cj4gPiBmb3IgYWxsIENQVXMgaXMgc3VwZXJpb3IuCj4gCj4g
VGhpcyBpcyBhIHZlcnkgc3BlY2lmaWMgY2FzZSB3aGljaCB5b3UgYXJlIHRyeWluZyB0byBvcHRp
bWl6ZSBhbmQgaW4gdGhlCj4gcHJvY2VzcyBodXJ0aW5nIHBlcmZvcm1hbmNlIGluIG1hbnkgb3Ro
ZXIgY2FzZXMuIFRoZXJlIGFyZSBtYW55IGhpZ2gKPiBzcGVlZCBJT3MgKG5ldHdvcmssIHN0b3Jh
Z2UsIGV0Yykgd2hlcmUgcmF0ZSBvZiBpbnRlcnJ1cHQgaXMgaGlnaCBzbyBmb3IKPiBzdWNoIElP
IHlvdXIgcGF0Y2ggd2lsbCBkZWdyYWRlIHBlcmZvcm1hbmNlIG9uIG11bHRpcGxlIENQVXMuCgpO
bywgaXQgd291bGRuJ3QgImh1cnRpbmcgcGVyZm9ybWFuY2UgaW4gbWFueSBvdGhlciBjYXNlcyIu
IEl0IHdvdWxkIGdpdmUKdXNlcnMgdGhlIGFiaWxpdHkgdG8gZG8gd2hhdCB0aGV5IHdhbnQsIGlu
Y2x1ZGluZyBodXJ0aW5nIHBlcmZvcm1hbmNlIGFzCnlvdSBzYWlkLCBvciBpbXByb3ZpbmcgcGVy
Zm9ybWFuY2UgYXMgSSBwb2ludGVkIG91dCBlYXJsaWVyLgoKSSBhbSB3aWxsaW5nIHRvIGJldCB0
aGF0IG1vc3QgdXNlcnMgZG9uJ3QgZXZlciB0b3VjaCB0aGlzLiBCdXQgaWYgdGhleSBkbywKdGhl
eSBiZXR0ZXIga25vdyB3aGF0IHRoZXkgYXJlIGRvaW5nLiBJZiB0aGV5IHdhbnQgdG8gd2FzdGUg
dGhlaXIgQ1BVCmN5Y2xlcywgc28gYmUgaXQuCgpNeSBwb2ludCBlc3NlbnRpYWxseSBpcyB0aGF0
IGtlcm5lbCBzaG91bGRuJ3QgZm9yY2UgYW55IHBvbGljeSBvbiB1c2Vycy4KVGhlIG9ubHkgY2Fz
ZSB0aGlzIG1ha2VzIHNlbnNlIGlzIHdoZW4gdGhlIHBvbGljeSBpcyBfc3RyaWN0bHlfIGJldHRl
ciB0aGFuCmFueXRoaW5nIGVsc2UsIHdoaWNoIGlzIG5vdCB0cnVlIGhlcmUuIFdoYXQgdGhlIGRy
aXZlciBzaG91bGQgZG8gaXMKcHJvdmlkaW5nIGEgImdvb2QgZW5vdWdoIGZvciBtb3N0IiBkZWZh
dWx0LCBidXQgc3RpbGwgbGV0IHVzZXJzIGRlY2lkZQp3aGF0J3MgYmVzdCBmb3IgdGhlbS4KClNp
ZGUgbm90ZTogaWYgSSBhbSBub3QgbWlzdGFrZW4sIHRoZSBlZmZlY3RpdmUgYWZmaW5pdHkgbWFz
ayB0aGluZyBpcyBmb3IKaGFyZHdhcmUgbGltaXRhdGlvbiBvZiB0aGUgY2hpcHMgd2hvIGNhbm5v
dCBlbmFibGUgaW50ZXJydXB0IGZvciBhbGwgQ1BVcwppbiB0aGUgbWFzay4gUklTQy1WIFBMSUMs
IG9uIHRoZSBvdGhlciBoYW5kLCBjYW4gZW5hYmxlIGludGVycnVwdHMgZm9yIGFueQpDUFUsIGFu
ZCB0aGVyZWZvcmUgc2hvdWxkIGRvIHNvLgoKQmVzdCByZWdhcmRzLApOYW0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
