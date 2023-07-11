Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4010EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdSPoPyjPmFDthTc0buJoqpSsxFREFHYyUcj9ELGPc0=; b=wfTw07lUqXyVGj
	hLFRmOzeWF0NW6YKFIzKAXALt8f95io/BSkcZ4OOGDO07TODcDSEJyajDlKWxh8wI57M0itvwu21Z
	CGGG9VXM69OZJCx0YK8xiaGrIYWV5qogioUBhM2kOcEzwyXGNlMd0cGaUggN9ZGPhm7CqIrZCPE5C
	+4DiAizR3hG9cEMPBWEq7CQdPSm0R7cYzjS3ZB0nQrsR+GMX98eL/t5oozuEwl5auaTAihbC028H4
	C/mVOISCU+W8APibtpb1f/5+PLrOtJR8rd2xTT4+b+vS4B4GdGWDXB2Am0tGeyJ6wkI36GLgJxR2B
	fwFl9m/hmoViWMJ2tERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHl3-00FcT0-2b;
	Tue, 11 Jul 2023 18:06:41 +0000
Received: from 5.mo560.mail-out.ovh.net ([87.98.181.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHl0-00FcS3-1D
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 18:06:40 +0000
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.16.135])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 48838279EA
	for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 18:06:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-42n7r (unknown [10.110.115.59])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CBA2B1FE33;
	Tue, 11 Jul 2023 18:06:33 +0000 (UTC)
Received: from courmont.net ([37.59.142.102])
	by ghost-submission-6684bf9d7b-42n7r with ESMTPSA
	id 5e55LSmarWQWAwAApIyesg
	(envelope-from <remi@remlab.net>); Tue, 11 Jul 2023 18:06:33 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004a521992a-6c1f-49e2-b636-6ed0849ec6b9,
                    BD5993DD31A8D185A8BDB9FDB50A3FED214DC06B) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/12] RISC-V: add helper function to read the vector VLEN
Date: Tue, 11 Jul 2023 21:06:32 +0300
Message-ID: <5073588.8QdJVB83L8@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230711153743.1970625-4-heiko@sntech.de>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-4-heiko@sntech.de>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11108691431442553307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkfhojghfggfgtgesthhqredttddtjeenucfhrhhomheptformhhiucffvghnihhsqdevohhurhhmohhnthcuoehrvghmihesrhgvmhhlrggsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfegfeefvdefueetleefffduuedvjeefheduueekieeltdetueetueeugfevffenucffohhmrghinheprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_110638_562380_B73CF62A 
X-CRM114-Status: GOOD (  18.06  )
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

TGUgdGlpc3RhaW5hIDExLiBoZWluw6RrdXV0YSAyMDIzLCAxOC4zNy4zNCBFRVNUIEhlaWtvIFN0
dWVibmVyIGEgw6ljcml0IDoKPiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJA
dnJ1bGwuZXU+Cj4gCj4gVkxFTiBkZXNjcmliZXMgdGhlIGxlbmd0aCBvZiBlYWNoIHZlY3RvciBy
ZWdpc3RlciBhbmQgc29tZSBpbnN0cnVjdGlvbnMKPiBuZWVkIHNwZWNpZmljIG1pbmltYWwgVkxF
TnMgdG8gd29yayBjb3JyZWN0bHkuCj4gCj4gVGhlIHZlY3RvciBjb2RlIGFscmVhZHkgaW5jbHVk
ZXMgYSB2YXJpYWJsZSByaXNjdl92c2l6ZSB0aGF0IGNvbnRhaW5zIHRoZQo+IHZhbHVlIG9mICIz
MiB2ZWN0b3IgcmVnaXN0ZXJzIHdpdGggdmxlbmIgbGVuZ3RoIiB0aGF0IGdldHMgZmlsbGVkIGR1
cmluZwo+IGJvb3QuIHZsZW5iIGlzIHRoZSB2YWx1ZSBjb250YWluZWQgaW4gdGhlIENTUl9WTEVO
QiByZWdpc3RlciBhbmQKPiB0aGUgdmFsdWUgcmVwcmVzZW50cyAiVkxFTiAvIDgiLgo+IAo+IFNv
IGFkZCByaXNjdl92ZWN0b3JfdmxlbigpIHRvIHJldHVybiB0aGUgYWN0dWFsIFZMRU4gdmFsdWUg
Zm9yIGluLWtlcm5lbAo+IHVzZXJzIHdoZW4gdGhleSBuZWVkIHRvIGNoZWNrIHRoZSBhdmFpbGFi
bGUgVkxFTi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJu
ZXJAdnJ1bGwuZXU+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggfCAx
MSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGluZGV4IGFjMmMyMzA0NWVlYy4uODhjZjc2YTIzMTZkIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gQEAgLTIzMiw0ICsyMzIsMTUgQEAgc3RhdGlj
IGlubGluZSBib29sCj4gcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkgeyBy
ZXR1cm4gZmFsc2U7IH0KPiAKPiAgI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfViAqLwo+IAo+
ICsvKgo+ICsgKiBSZXR1cm4gdGhlIGltcGxlbWVudGF0aW9uJ3MgdmxlbiB2YWx1ZS4KPiArICoK
PiArICogcmlzY3ZfdnNpemUgY29udGFpbnMgdGhlIHZhbHVlIG9mICIzMiB2ZWN0b3IgcmVnaXN0
ZXJzIHdpdGggdmxlbmIKPiBsZW5ndGgiICsgKiBzbyByZWJ1aWxkIHRoZSB2bGVuIHZhbHVlIGlu
IGJpdHMgZnJvbSBpdC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgaW50IHJpc2N2X3ZlY3Rvcl92
bGVuKHZvaWQpCj4gK3sKPiArCXJldHVybiByaXNjdl92X3ZzaXplIC8gMzIgKiA4Owo+ICt9CgpL
Vk0gYWxyZWFkeSBoYXMgYSBiZXNwb2tlIGNvbnZlcnNpb24gdG8gYnl0ZXMgKHJhdGhlciB0aGFu
IGJpdHMpLiBGYWN0b3IgY29kZT8KCj4gKwo+ICAjZW5kaWYgLyogISBfX0FTTV9SSVNDVl9WRUNU
T1JfSCAqLwoKCi0tIArjg6zjg5/jg7vjg4fjg4st44Kv44O844Or44Oi44OzCmh0dHA6Ly93d3cu
cmVtbGFiLm5ldC8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
