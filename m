Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B93CD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q44oYbknwlwz9TF+OMxIwjXjg7KfmEqenFXP5N4ocSU=; b=yaW8ptMKYYsPCO
	35GLZ0mmnSeO3SPvPzPuLQ2j1xx0N173KuYZ+kE2KqTmjhhys+pWd+XkujNMtXmc0W3WnENUWzJaT
	X8EbRkbJcSQHhqaG3Kiv9Ps5UDBlR/b/q2Wc4LcdckO3Hw+A7T54qdSTpo9lHrH6OTJpcyAZPDIlm
	I9RO4D281iriowyjqCesjXqnItbxfP+Dsruhb8+pV+zkDsQaEjaqa0Ltd9VRbWaUhAchYkMDm2ByF
	Q5nhwAaWRWtVzwzhbpPdKb8u4T/KJ4Piyn5Db2UZBY2FCxaTAt9a8fZWUzVuMu6wUy/pab+SzbSPK
	2n3fvtdR9jpUyYjueQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFne-00000001b3Q-26r8;
	Thu, 18 Jun 2026 16:41:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFnd-00000001b3H-0K47
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 16:41:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AB55600BB
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 16:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DE21F00ACF
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781800863;
	bh=DwKsFa5RJnYwBMeG4/pXUjfZncf00tGOLypqlsoEZ3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QxFo8JRy/i6RgWrm++yRZfl0DmadbNPwoVsHIDadhwSiiTRMqA24qe2UFhLn+HFA7
	 tRKYvK3mzWwl6Xp2+FwCZ9jyOTy3DNz6XzUqb+SGFonXksnBt8bDR/NMlrR7Z6uu7K
	 pGktRTVM09Z77kn3AZ/65maVYJmJtvH371Tw7ZTvoaSqskB1u7zBXHX/H+DdRaGFek
	 Zx2IZpFJVO+Ap9kZ/hLWknlCqIyhJSr+8nPfRlXORHbHLTyb9cabZ+pY9I7V4cUQVf
	 2ErXjd9it+ngoyA+c0E6SV7u5Cco9AdTUSomx+6HPqLpp1X8H2i/PfYY02t0fqLdiX
	 bpkF+FsIxjxXg==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso9044075e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 09:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FT/6fYPnZoqHucTN7d5OvXlcakC0ddcBuHEB1SEIG8XV2iiqmmM+AOmseSckQOKDcs7dGrP1bQj5eSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWqrYQ3sYcXbiKzio+gMVADFrxfSQVloXN3EFd9gBRTqutHadS
	5mytLUErMvxSZ88xS/sOw+iwQftEtYAKuCngC63URbDC8t7HDZIAbbzPXbwv29lfrd+zIBqK9M2
	bDuiC0svNniYlFYeCRRCxMvQZv+gRnQk=
X-Received: by 2002:a05:600c:8b23:b0:490:9bc2:bf8b with SMTP id
 5b1f17b1804b1-4923ef4c619mr7649625e9.5.1781800862561; Thu, 18 Jun 2026
 09:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin>
In-Reply-To: <20260618143634.7f3dd6c5@pumpkin>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 19 Jun 2026 00:40:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
X-Gm-Features: AVVi8CcZhG0mWJZmtdZAhMmhoQz5zhsKhOiiURUGK7ccGb-9Zpcy9ToqnAL-Dt0
Message-ID: <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, zhangzhanpeng.jasper@bytedance.com, 
	alex@ghiti.fr, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com, 
	iommu@lists.linux.dev, joro@8bytes.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, luxu.kernel@bytedance.com, 
	palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, will@kernel.org, yuanzhu@bytedance.com
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgOTozNuKAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDE4IEp1biAyMDI2IDE3OjUx
OjM0ICswODAwCj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBIaSBW
aXZpYW4sCj4gPgo+ID4gQXMgbm90ZWQgaW4gdGhlIFJJU0MtViBJT01NVSBTcGVjaWZpY2F0aW9u
LCBDaGFwdGVyIDY6Cj4gPiA+IFdoZXRoZXIgYW4gOC1ieXRlIGFjY2VzcyB0byBhbiBJT01NVSBy
ZWdpc3RlciBpcyBzaW5nbGUtY29weSBhdG9taWMgaXMgVU5TUEVDSUZJRUQsIGFuZCBzdWNoIGFu
IGFjY2VzcyBtYXkgYXBwZWFyLCBpbnRlcm5hbGx5IHRvIHRoZSBJT01NVSwgYXMgaWYgdHdvIHNl
cGFyYXRlIDQtYnl0ZSBhY2Nlc3NlcyDigJQgZmlyc3QgdG8gdGhlIGhpZ2ggaGFsZiBhbmQgc2Vj
b25kIHRvIHRoZSBsb3cgaGFsZiDigJQgd2VyZSBwZXJmb3JtZWQuCj4gPgo+ID4gVGhlcmVmb3Jl
LCB0aGUgYXRvbWljaXR5IG9mIDY0LWJpdCBNTUlPIGFjY2Vzc2VzIGlzIFVOU1BFQ0lGSUVEIGFu
ZAo+ID4gbm90IGNsZWFybHkgZGVmaW5lZCBpbiB0aGUgY3VycmVudCByYXRpZmllZCBSSVNDLVYg
SU9NTVUKPiA+IHNwZWNpZmljYXRpb24uIFRvIGhhbmRsZSB0aGlzIGNvcnJlY3RseSwgdGhlIExp
bnV4IFJJU0MtViBJT01NVSBkcml2ZXIKPiA+IHNob3VsZCBmYWxsIGJhY2sgdG8gMzItYml0IE1N
SU8gYWNjZXNzZXMgd2hlbiByZWFkaW5nIDY0LWJpdCByZWdpc3RlcnMKPiA+IChlLmcuLCBwZXJm
b3JtYW5jZSBjb3VudGVycykuIFRoZSBiZWhhdmlvciBvZiAzMi1iaXQgTU1JTyBhY2Nlc3NlcyBp
cwo+ID4gbW9yZSBwcmVjaXNlbHkgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElPTU1VIHNwZWNpZmlj
YXRpb24uCj4gPgo+ID4gVGh1cywgbWFueSBoYXJkd2FyZSB2ZW5kb3JzIGltcGxlbWVudCAzMi1i
aXQgTU1JTyAocmF0aGVyIHRoYW4gNjQtYml0Cj4gPiBNTUlPKSBiYXNlZCBvbiB0aGUgY3VycmVu
dCByYXRpZmllZCBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiwgYW5kCj4gPiB0aGlzIGRyaXZl
ciBkb2VzIG5vdCBhcHBlYXIgdG8gYmVuZWZpdCBmcm9tIDY0LWJpdCBNTUlPIGFjY2VzcyBlaXRo
ZXIuCj4gPiBQZXJmb3JtYW5jZSBpcyBmdW5kYW1lbnRhbGx5IGNvbnN0cmFpbmVkIGJ5IGJ1cyBs
YXRlbmN5OyBhc3N1bWluZyB0aGF0Cj4gPiBzaW1wbHkgcmVkdWNpbmcgdGhlIG51bWJlciBvZiBh
Y2Nlc3NlcyB3aWxsIGltcHJvdmUgcGVyZm9ybWFuY2UgaXMgYW4KPiA+IG92ZXJzaW1wbGlmaWNh
dGlvbiB0aGF0IGlnbm9yZXMgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUKPiA+IGNoYXJhY3Rlcmlz
dGljcy4KPgo+IElmIHRoZSBidXMgbGF0ZW5jeSBpcyBzaWduaWZpY2FudCBpdCBpcyBhbG1vc3Qg
Y2VydGFpbmx5IHdvcnRoIHVzaW5nCj4gbWVtb3J5IGFjY2Vzc2VzIHRvIGF2b2lkIHJlLXJlYWRp
bmcgdGhlIGhpIHJlZ2lzdGVyLgo+Cj4gU29tZXRoaW5nIGxpa2UgdGhpcyBtaWdodCB3b3JrOgo+
Cj4gc3RhdGljIHZvbGF0aWxlIHUzMiBoaV9wcmV2LCBsb19wcmV2Owo+Cj4gICAgICAgICB1MzIg
aGkgPSByZWFkX3JlZ19oaSgpOwo+ICAgICAgICAgdTMyIGxvID0gcmVhZF9yZWdfbG8oKTsKPgo+
ICAgICAgICAgaWYgKGxvIDw9IGxvX3ByZXYgfHwgaGkgIT0gaGlfcHJldikgewo+ICAgICAgICAg
ICAgICAgICB1MzIgaGlfdG1wID0gcmVhZF9yZWdfaGk7Cj4gICAgICAgICAgICAgICAgIGlmICho
aV90bXAgIT0gaGkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBoaSA9IGhpX3RtcDsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBsbyA9IDA7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAg
ICAgICAgICAgICAgbG9fcHJldiA9IH4wdTsKPiAgICAgICAgICAgICAgICAgaGlfcHJldiA9IGhp
Owo+ICAgICAgICAgfQo+ICAgICAgICAgbG9fcHJldiA9IGxvOwo+ICAgICAgICAgcmV0dXJuICh1
NjQpaGkgPDwgMzIgfCBsbzsKPgo+IEl0IHNob3VsZG4ndCBuZWVkIGFueSBsb2NraW5nIGJ1dCB0
aGUgYWNjZXNzZXMgZG8gbmVlZCB0byBiZSBvcmRlcmVkLgpUaGFuayB5b3UgZm9yIHRoZSBzdWdn
ZXN0aW9uLiBIb3dldmVyLCBJIGJlbGlldmUgdGhpcyBmZWVkYmFjayBpcyBtb3JlCnJlbGV2YW50
IHRvIHRoZSBSSVNDLVYgSU9NTVUgSFBNIHBhdGNoc2V0IFsxXSwgYXMgbm8gY291bnRlciByZWdp
c3RlcnMKYXJlIGludm9sdmVkIGluIHRoZSBjdXJyZW50IHBhdGNoc2V0LiBUaGF0IHNhaWQsIHRo
ZSBpZGVhIG9mIGltcHJvdmluZwp0aGUgaGktbG8taGkgc2xvdy1wYXRoIG1lY2hhbmlzbSB0byBi
ZXR0ZXIgaGFuZGxlIGhpZ2gtbGF0ZW5jeQpoYXJkd2FyZSBzY2VuYXJpb3MgaXMgd2VsbCB0YWtl
biBhbmQgd29ydGggZGlzY3Vzc2luZyBpbiB0aGUKYXBwcm9wcmlhdGUgdGhyZWFkLgpbMV06IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwMjA4MDYzODQ4LjM1NDc4MTct
Mi16b25nLmxpQHNpZml2ZS5jb20vCgpQLlMuIFRoZSBoYXJkd2FyZSBJIGhhdmUgYXQgaGFuZCBl
eGhpYml0cyB2ZXJ5IGxvdyBpbnRlcmNvbm5lY3QKbGF0ZW5jeS4gQW5kIEkgaGF2ZSBuZXZlciBv
YnNlcnZlZCB0aGUgc2xvdyBwYXRoIHdoZXJlIGhpX3RtcCAhPSBoaQpiZWluZyB0cmlnZ2VyZWQg
4oCUIG15IGFwcHJvYWNoIHdhcyB0byByZW1vdmUgdGhlIHJldHJ5IG1lY2hhbmlzbQpkaXJlY3Rs
eSBpbiAzMi1iaXQgbW1pbyBtb2RlIGFuZCBydW4gc3RyZXNzIHRlc3RzIHRvIGNoZWNrIHdoZXRo
ZXIKcGVyZiBzdGF0IHByb2R1Y2VkIGluY29ycmVjdCByZXN1bHRzLiBUaGF0IHNhaWQsIEkgbWF5
IGhhdmUgc2ltcGx5CmJlZW4gbHVja3kgaW5zdGVhZCBvZiBodyBndWFyYW50ZWUuCgotLSAKQmVz
dCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
