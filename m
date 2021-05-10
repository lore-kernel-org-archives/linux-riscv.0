Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF824C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:00:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F17061075
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F17061075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M0s9O4nsifgiRqrAxqS33dqbnh4ayq14M94swMvSnuM=; b=iDFxtOJByb/Kd6y8XUn4JsRCM
	SLxDoimWZvvL+t3XIREpg3dzHLVYmoH752NspLu08Gw578vasTGqVa3+xjU9TaMWLtIwjavdCKTeU
	7Etvws53tH4NBckxd62bMIGwcsW6pANP1uOkGQUnuAZhZmuoHf029igSAPC2uNpneYg9Bi2e1lugN
	un8nAFBsldPv6ezPREe0iAqFo/QYDf8keCQZ5HR9d1SNoAqAOvU47vnQw5hw/WAa6YgJcxoyOsqRi
	ORWXLq/o02rMEUXKnOgtCPLSqPD9Q8N13dHkX/NRb2MpNxE1TwvkHUSPRzT1iPLo964Ldd/giQaJR
	CaqT3bJeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg6Rx-00EYPs-FR; Mon, 10 May 2021 13:59:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6Rg-00EYMU-6c; Mon, 10 May 2021 13:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=i6vAxLOytNOYwyM1NYfARO0i+7jkuFK7y9pYt7pXuwE=; b=djb3CWn/LU378IzapvABLkn8Gd
 Mp82QkScestEUeQW2L+zqtEN7XvYp31eFRebvjBEITr//+6YOo6+SYheq9BxF7YMTeqbS+RN1ORYU
 WcTwnub1JAhAEwo1EbdH4ZtDbzKRVhVt7KKBx8eH43WzT6ZsZkO7OQPiITlB671P2UStmst5kwHpO
 oLDGkct+Pf7s4vCchonkHPjgJ2dHAgGdY9eEvhnNfgt0nMzg4EJ/N8O7mpCEUjiq1yDlLopkoOUQy
 tCb7mahOMAZ84vugzBeIjfIYkNlViOtJdTlUAmJVQy5eePLrQct4R8yXLPW7Hy+DjovMg5jAZGdoa
 yuW/o03A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lg6RA-006DIB-7H; Mon, 10 May 2021 13:59:19 +0000
Date: Mon, 10 May 2021 14:59:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
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
Message-ID: <YJk8LMFViV7Z3Uu7@casper.infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
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

T24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMDI6MTY6MTZQTSArMDEwMCwgRWR3YXJkIENyZWUgd3Jv
dGU6Cj4gT24gMTAvMDUvMjAyMSAxMjo1NSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+
ID4gVGhlIG1haW4gcG9pbnQgb24gdGhpcyBzZXJpZXMgaXMgdG8gcmVwbGFjZSBqdXN0IHRoZSBv
Y2N1cnJlbmNlcwo+ID4gd2hlcmUgQVNDSUkgcmVwcmVzZW50cyB0aGUgc3ltYm9sIGVxdWFsbHkg
d2VsbAo+IAo+ID4gCS0gVSsyMDE0ICgn4oCUJyk6IEVNIERBU0gKPiBFbSBkYXNoIGlzIG5vdCB0
aGUgc2FtZSB0aGluZyBhcyBoeXBoZW4tbWludXMsIGFuZCB0aGUgbGF0dGVyIGRvZXMgbm90Cj4g
IHNlcnZlICdlcXVhbGx5IHdlbGwnLiAgUGVvcGxlIHVzZSBlbSBkYXNoZXMgYmVjYXVzZSDigJQg
ZXZlbiBpbgo+ICBtb25vc3BhY2UgZm9udHMg4oCUIHRoZXkgbWFrZSB0ZXh0IGVhc2llciB0byBy
ZWFkIGFuZCBjb21wcmVoZW5kLCB3aGVuCj4gIHVzZWQgY29ycmVjdGx5Lgo+IEkgYWNjZXB0IHRo
YXQgc29tZSBvZiB0aGUgb3RoZXIgZGlzdGluY3Rpb25zIOKAlCBsaWtlIGVuIGRhc2hlcyDigJQg
YXJlCj4gIG5lZWRsZXNzbHkgcGVkYW50aWMgKHRob3VnaCBJIGRvbid0IGRvdWJ0IHRoZXJlIGlz
IHNvbWVvbmUgb3V0IHRoZXJlCj4gIHdobyB3aWxsIGdsYWRseSBkZWZlbmQgdGhlbSB3aXRoIHRo
ZSBzYW1lIGZlcnZvdXIgd2l0aCB3aGljaCBJIGFyZ3VlCj4gIGZvciB0aGUgZW0gZGFzaCkgYW5k
IEkgd291bGRuJ3QgdGFrZSB0aGUgdHJvdWJsZSB0byB1c2UgdGhlbSBteXNlbGY7Cj4gIGJ1dCBJ
IHRoaW5rIHRoZXJlIGlzIGEgcmVhc29uYWJsZSBhc3N1bXB0aW9uIHRoYXQgd2hlbiBzb21lb25l
IGdvZXMKPiAgdG8gdGhlIGVmZm9ydCBvZiB1c2luZyBhIFVuaWNvZGUgcHVuY3R1YXRpb24gbWFy
ayB0aGF0IGlzIHNlbWFudGljCj4gIChyYXRoZXIgdGhhbiBtZXJlbHkgdHlwb2dyYXBoaWNhbCks
IHRoZXkgcHJvYmFibHkgaGFkIGEgcmVhc29uIGZvcgo+ICBkb2luZyBzby4KCkkgdGhpbmsgeW91
J3JlIG92ZXJlc3RpbWF0aW5nIHRoZSBhbW91bnQgb2YgY2FyZSBhbmQgdHlwb2dyYXBoaWNhbApr
bm93bGVkZ2UgdGhhdCB5b3VyIGF2ZXJhZ2Uga2VybmVsIGRldmVsb3BlciBoYXMuICBNb3N0IG9m
IHRoZXNlClVURi04IGNoYXJhY3RlcnMgY29tZSBmcm9tIGxhdGV4IGNvbnZlcnNpb25zIGFuZCBy
ZWFsbHkgYXJlbid0Cm5lY2Vzc2FyeSAoYW5kIGFyZSBiZWluZyB1c2VkIGluY29ycmVjdGx5KS4K
CllvdSBzZWVtIHF1aXRlIGtub3dlZGdlYWJsZSBhYm91dCB0aGUgdmFyaW91cyBkaWZmZXJlbmNl
cy4gIFBlcmhhcHMKeW91J2QgYmUgd2lsbGluZyB0byB3cml0ZSBhIGRvY3VtZW50IGZvciBEb2N1
bWVudGF0aW9uL2RvYy1ndWlkZS8KdGhhdCBwcm92aWRlcyBndWlkYW5jZSBmb3Igd2hlbiB0byB1
c2Ugd2hpY2gga2luZHMgb2YgaG9yaXpvbnRhbApsaW5lPyAgaHR0cHM6Ly93d3cucHVuY3R1YXRp
b25tYXR0ZXJzLmNvbS9oeXBoZW4tZGFzaC1uLWRhc2gtYW5kLW0tZGFzaC8KdGFsa3MgYWJvdXQg
aXQgaW4gdGhlIGNvbnRleHQgb2YgcHVibGljYXRpb25zLCBidXQgSSB0aGluayB3ZSBuZWVkCnNv
bWV0aGluZyBtb3JlIHN1aXRlZCB0byBvdXIgbmVlZHMgZm9yIGtlcm5lbCBkb2N1bWVudGF0aW9u
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
