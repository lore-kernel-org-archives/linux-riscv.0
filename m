Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F82C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 12:05:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03CD613C2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 12:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E03CD613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/KQei4duKQzpGChqDLJCFfiefSy8i3zV6BBgqVABKU=; b=EznylyxJ2AFgNullSpA9/50Zh
	UOkKlQpMz1xkleV2nU5oQGCXBZWeEW0Pxp81/HUfALDo2jX1wofdIFPeWcYyWQDfPSo/wIRhmlNiF
	uePk41QD0HpY0QU31o9Bs2YkUyrf4u6xVszxxFsHdOM9OX/47AlRxQvKLrHs8Rt29bXe1tL/qqIVu
	0xTr2x/Ces4zXWova4Eu/oFbtdP1Xo3MImctDEBITyfQYf74BfYG6vsSRcTss04v9w/9e1SffVCAq
	c8TaoOEvEoL9BRTIcGJUq09peINUDzxzgOGmyyunX478L08daAWO4mbVmF/sgAZr8oV1BKgLyTNrm
	gWoFyH9bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4fC-00EBiA-0r; Mon, 10 May 2021 12:05:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4Vb-00E9wW-GP; Mon, 10 May 2021 11:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=KQTuFYHZIpy7ah4plsRk5EIuJ1MgtrwGpK9+hGS6HBE=; b=RMIMF6nKfjPtZaxFKbwQsxswx2
 lXF2SHThEaZjZTn8JDZ8wSrMmnBOENa7xSNF5LoEpRIDqxgvoblZgRl97XrzsQn9FeuQUeBVMGAS5
 B0ye87XDG6KL8DorIquN3ZKavKkZb4ClQsJI/ZjbBTd/3L4ZXZqaaNq+Uy++NK9UdVD/LhahxCfSy
 wdjPwueytSynqZx1Hcj4pqm5+eGRS6Yn1QIt+c2pt+8w2hCzWBu5oJ6pcbwOEN4JYDV9uz4xOahHa
 9iV8/sFtXNHNcShJQOflFF2+qJNAz3TQhDJnvRX6VPgWXtQZGsiLH5kO0S2yBPZ3fqg/r3OBabfHV
 bn9Wxa/Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4VV-008eK3-Jm; Mon, 10 May 2021 11:55:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 383C061260;
 Mon, 10 May 2021 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620647729;
 bh=dyIPtb49LgFnCoKazyq+bQhPSj3PCobNssG21KHdoK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4cpkndG9UuTYGkhKfO3hJLbYIHDWve5Su3QQFRXInDkMRoAu9bVjsNPKBQQExFiA
 MH/LvEqboPFe5Mg323DsrqgW7WJPZfjJ5OWh3KcGd7Kzb/Ed/OuhsjfzebDsCLf+jo
 Z2y3h21hX1f0r0znndE/gsvI3+7MfvcFNE3R9vJ3F6eSaoK3rYc9HAxpysQKCzq2nw
 XliTZNXkMCNQpYy6ormSrp00pDOW21OImF+xXBpjWC/JIXAZfq/wrXo3rh38peS5/g
 BQeri8Wl+fs0ihvm/Fcaw0vxpMvqk7Fkm7kctYIMuGKithMKv3Kd8J2NMAGsk2M1IJ
 Z8/9XzwZufeKA==
Date: Mon, 10 May 2021 13:55:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210510135518.305cc03d@coco.lan>
In-Reply-To: <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_045529_745898_34EB6113 
X-CRM114-Status: GOOD (  31.65  )
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

SGkgRGF2aWQsCgpFbSBNb24sIDEwIE1heSAyMDIxIDExOjU0OjAyICswMTAwCkRhdmlkIFdvb2Ro
b3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gZXNjcmV2ZXU6Cgo+IE9uIE1vbiwgMjAyMS0wNS0x
MCBhdCAxMjoyNiArMDIwMCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+ID4gVGhlcmUg
YXJlIHNldmVyYWwgVVRGLTggY2hhcmFjdGVycyBhdCB0aGUgS2VybmVsJ3MgZG9jdW1lbnRhdGlv
bi4KPiA+IAo+ID4gU2V2ZXJhbCBvZiB0aGVtIHdlcmUgZHVlIHRvIHRoZSBwcm9jZXNzIG9mIGNv
bnZlcnRpbmcgZmlsZXMgZnJvbQo+ID4gRG9jQm9vaywgTGFUZVgsIEhUTUwgYW5kIE1hcmtkb3du
LiBUaGV5IHdlcmUgcHJvYmFibHkgaW50cm9kdWNlZAo+ID4gYnkgdGhlIGNvbnZlcnNpb24gdG9v
bHMgdXNlZCBvbiB0aGF0IHRpbWUuCj4gPiAKPiA+IE90aGVyIFVURi04IGNoYXJhY3RlcnMgd2Vy
ZSBhZGRlZCBhbG9uZyB0aGUgdGltZSwgYnV0IHRoZXkncmUgZWFzaWx5Cj4gPiByZXBsYWNlYWJs
ZSBieSBBU0NJSSBjaGFycy4KPiA+IAo+ID4gQXMgTGludXggZGV2ZWxvcGVycyBhcmUgYWxsIGFy
b3VuZCB0aGUgZ2xvYmUsIGFuZCBub3QgZXZlcnlib2R5IGhhcyBVVEYtOAo+ID4gYXMgdGhlaXIg
ZGVmYXVsdCBjaGFyc2V0LCBiZXR0ZXIgdG8gdXNlIFVURi04IG9ubHkgb24gY2FzZXMgd2hlcmUg
aXQgaXMgcmVhbGx5Cj4gPiBuZWVkZWQuICAKPiAKPiBObywgdGhhdCBpcyBhYnNvbHV0ZWx5IHRo
ZSB3cm9uZyBhcHByb2FjaC4KPiAKPiBJZiBzb21lb25lIGhhcyBhIGxvY2FsIHNldHVwIHdoaWNo
IG1ha2VzIGJvZ3VzIGFzc3VtcHRpb25zIGFib3V0IHRleHQKPiBlbmNvZGluZ3MsIHRoYXQgaXMg
dGhlaXIgb3duIG1pc3Rha2UuCj4gCj4gV2UgZG9uJ3QgZG8gdGhlbSBhbnkgZmF2b3VycyBieSB0
cnlpbmcgdG8gKmhpZGUqIGl0IGluIHRoZSBjb21tb24gY2FzZQo+IHNvIHRoYXQgdGhleSBkb24n
dCBub3RpY2UgaXQgZm9yIGxvbmdlci4KPiAKPiBUaGVyZSByZWFsbHkgaXNuJ3QgbXVjaCBleGN1
c2UgZm9yIHN1Y2ggYnJva2VubmVzcywgdGhpcyBmYXIgaW50byB0aGUKPiAyMXN0IGNlbnR1cnku
Cj4gCj4gRXZlbiAqYmVmb3JlKiBVVEYtOCBjYW1lIGFsb25nIGluIHRoZSBmaW5hbCBkZWNhZGUg
b2YgdGhlIGxhc3QKPiBtaWxsZW5uaXVtLCBpdCB3YXMgaW1wb3J0YW50IHRvIGtub3cgd2hpY2gg
Y2hhcmFjdGVyIHNldCBhIGdpdmVuIHBpZWNlCj4gb2YgdGV4dCB3YXMgZW5jb2RlZCBpbi4KPiAK
PiBJbiBmYWN0IGl0IHdhcyBldmVuICptb3JlKiBpbXBvcnRhbnQgYmFjayB0aGVuLCB3ZSBjb3Vs
ZG4ndCBqdXN0IGFzc3VtZQo+IFVURi04IGV2ZXJ5d2hlcmUgbGlrZSB3ZSBjYW4gaW4gbW9kZXJu
IHRpbWVzLgo+IAo+IEdpdCBjYW4gYWxyZWFkeSBkbyB0aGluZ3MgbGlrZSBDUkxGIGNvbnZlcnNp
b24gb24gY2hlY2tpbmcgZmlsZXMgb3V0IHRvCj4gbWF0Y2ggbG9jYWwgY29udmVudGlvbnM7IGlm
IHlvdSB3YW50IHRvIHRlYWNoIGl0IHRvIGRvIGNoYXJhY3RlciBzZXQKPiBjb252ZXJzaW9ucyB0
b28gdGhlbiBJIHN1cHBvc2UgdGhhdCBtaWdodCBiZSB1c2VmdWwgdG8gYSBmZXcgZGV2ZWxvcGVy
cwo+IHdobyd2ZSBmYWxsZW4gdGhyb3VnaCBhIHRpbWUgd2FycCBhbmQgc3RpbGwgbmVlZCBpdC4g
QnV0IG5vYm9keSdzIGV2ZXIKPiBib3RoZXJlZCBiZWZvcmUgYmVjYXVzZSBpdCBqdXN0IGlzbid0
IG5lY2Vzc2FyeSB0aGVzZSBkYXlzLgo+IAo+IFBsZWFzZSAqZG9uJ3QqIGF0dGVtcHQgdG8gYWRk
cmVzcyB0aGlzIGFuYWNocm9uaXN0aWMgYW5kIGVzb3RlcmljCj4gInJlcXVpcmVtZW50IiBieSBk
cmFnZ2luZyB0aGUga2VybmVsIHNvdXJjZSBiYWNrIGluIHRpbWUgYnkgdGhyZWUKPiBkZWNhZGVz
LgoKTm8uIFRoZSBpZGVhIGlzIG5vdCB0byBnbyBiYWNrIHRocmVlIGRlY2FkZXMgYWdvLiAKClRo
ZSBnb2FsIGlzIGp1c3QgdG8gYXZvaWQgdXNlIFVURi04IHdoZXJlIGl0IGlzIG5vdCBuZWVkZWQu
IFNlZSwgdGhlIHZhc3QKbWFqb3JpdHkgb2YgVVRGLTggY2hhcnMgYXJlIGtlcHQ6CgoJLSBOb24t
QVNDSUkgTGF0aW4gYW5kIEdyZWVrIGNoYXJzOwoJLSBCb3ggZHJhd2luZ3M7CgktIGFycm93czsK
CS0gbW9zdCBzeW1ib2xzLgoKVGhlcmUsIGl0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UgdG8ga2VlcCB1
c2luZyBVVEYtOC4KCldlIHNob3VsZCBrZWVwIHVzaW5nIFVURi04IG9uIEtlcm5lbC4gVGhpcyBp
cyBzb21ldGhpbmcgdGhhdCBpdCBzaG91bGRuJ3QKYmUgY2hhbmdlZC4KCi0tLQoKVGhpcyBwYXRj
aCBzZXJpZXMgaXMgZG9pbmcgY29udmVyc2lvbiBvbmx5IHdoZW4gdXNpbmcgQVNDSUkgbWFrZXMK
bW9yZSBzZW5zZSB0aGFuIHVzaW5nIFVURi04LiAKClNlZSwgYSBudW1iZXIgb2YgY29udmVydGVk
IGRvY3VtZW50cyBlbmRlZCB3aXRoIHdlaXJkIGNoYXJhY3RlcnMKbGlrZSBaRVJPIFdJRFRIIE5P
LUJSRUFLIFNQQUNFIChVK0ZFRkYpIGNoYXJhY3Rlci4gVGhpcyBzcGVjaWZpYwpjaGFyYWN0ZXIg
ZG9lc24ndCBkbyBhbnkgZ29vZC4KCk90aGVycyB1c2UgTk8tQlJFQUsgU1BBQ0UgKFUrQTApIGlu
c3RlYWQgb2YgMHgyMC4gSGFybWxlc3MsIHVudGlsCnNvbWVvbmUgdHJpZXMgdG8gdXNlIGdyZXBb
MV0uCgpbMV0gdHJ5IHRvIHJ1bjoKCiAgICAkIGdpdCBncmVwICJDUFUgMCBoYXMgYmVlbiIgRG9j
dW1lbnRhdGlvbi9SQ1UvCgogICAgaXQgd2lsbCByZXR1cm4gbm90aGluZyB3aXRoIGN1cnJlbnQg
dXBzdHJlYW0uCgogICAgQnV0IGl0IHdpbGwgd29yayBmaW5lIGFmdGVyIHRoZSBzZXJpZXMgaXMg
YXBwbGllZDoKCiAgICAkIGdpdCBncmVwICJDUFUgMCBoYXMgYmVlbiIgRG9jdW1lbnRhdGlvbi9S
Q1UvCiAgICAgIERvY3VtZW50YXRpb24vUkNVL0Rlc2lnbi9EYXRhLVN0cnVjdHVyZXMvRGF0YS1T
dHJ1Y3R1cmVzLnJzdDp8ICMuIENQVSAwIGhhcyBiZWVuIGluIGR5bnRpY2staWRsZSBtb2RlIGZv
ciBxdWl0ZSBzb21lIHRpbWUuIFdoZW4gaXQgICB8CiAgICAgIERvY3VtZW50YXRpb24vUkNVL0Rl
c2lnbi9EYXRhLVN0cnVjdHVyZXMvRGF0YS1TdHJ1Y3R1cmVzLnJzdDp8ICAgIG5vdGljZXMgdGhh
dCBDUFUgMCBoYXMgYmVlbiBpbiBkeW50aWNrIGlkbGUgbW9kZSwgd2hpY2ggcXVhbGlmaWVzICB8
CgpUaGUgbWFpbiBwb2ludCBvbiB0aGlzIHNlcmllcyBpcyB0byByZXBsYWNlIGp1c3QgdGhlIG9j
Y3VycmVuY2VzCndoZXJlIEFTQ0lJIHJlcHJlc2VudHMgdGhlIHN5bWJvbCBlcXVhbGx5IHdlbGws
IGUuIGcuIGl0IGlzIGxpbWl0ZWQKZm9yIHRob3NlIGNoYXJzOgoKCS0gVSsyMDEwICgn4oCQJyk6
IEhZUEhFTgoJLSBVKzAwYWQgKCfCrScpOiBTT0ZUIEhZUEhFTgoJLSBVKzIwMTMgKCfigJMnKTog
RU4gREFTSAoJLSBVKzIwMTQgKCfigJQnKTogRU0gREFTSAoKCS0gVSsyMDE4ICgn4oCYJyk6IExF
RlQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCgktIFUrMjAxOSAoJ+KAmScpOiBSSUdIVCBTSU5HTEUg
UVVPVEFUSU9OIE1BUksKCS0gVSswMGI0ICgnwrQnKTogQUNVVEUgQUNDRU5UCgoJLSBVKzIwMWMg
KCfigJwnKTogTEVGVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKCS0gVSsyMDFkICgn4oCdJyk6IFJJ
R0hUIERPVUJMRSBRVU9UQVRJT04gTUFSSwoKCS0gVSswMGQ3ICgnw5cnKTogTVVMVElQTElDQVRJ
T04gU0lHTgoJLSBVKzIyMTIgKCfiiJInKTogTUlOVVMgU0lHTgoKCS0gVSsyMjE3ICgn4oiXJyk6
IEFTVEVSSVNLIE9QRVJBVE9SCgkgICh0aGlzIG9uZSB1c2VkIGFzIGEgcG9pbnRlciByZWZlcmVu
Y2UgbGlrZSAiKmZvbyIgb24gQyBjb2RlCgkgICBleGFtcGxlIGluc2lkZSBhIGRvY3VtZW50IGNv
bnZlcnRlZCBmcm9tIExhVGVYKQoKCS0gVSswMGJiICgnwrsnKTogUklHSFQtUE9JTlRJTkcgRE9V
QkxFIEFOR0xFIFFVT1RBVElPTiBNQVJLCgkgICh0aGlzIG9uZSBhbHNvIHVzZWQgd3JvbmdseSBv
biBhbiBBQkkgZmlsZSwgbWVhbmluZyAnPicpCgoJLSBVKzAwYTAgKCfCoCcpOiBOTy1CUkVBSyBT
UEFDRQoJLSBVK2ZlZmYgKCfvu78nKTogWkVSTyBXSURUSCBOTy1CUkVBSyBTUEFDRQoKVXNpbmcg
dGhlIGFib3ZlIHN5bWJvbHMgd2lsbCBqdXN0IHRyaWNrIHRvb2xzIGxpa2UgZ3JlcCBmb3Igbm8g
Z29vZApyZWFzb24uCgpUaGFua3MsCk1hdXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
