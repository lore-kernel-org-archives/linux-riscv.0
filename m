Return-Path: <SRS0=6USs=L4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,INVALID_MSGID,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1227C07E95
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 10:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E162E613E9
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 10:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E162E613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/EmySFYNp3KrFWzyD+xTB1ukZcNDAUDNzh3IZF6/kk=; b=B5xVjZZhQawe5K6YVXGmx49AKV
	DciXlfdaf/p6uF44Y8LEMw3M7+hOzDG3ddgG2gWpxuayBnOU8GkvMpQmlU9DMp5N9BlpHnoVZ/BSI
	HhvaLGonn6wpYKmZkrdUg2yKqOJn8xlkA9xIcDp7dKV+sfVsrVmFE16uZ4ESjoISSWqrb6/wPXdzA
	aYEUtI3wG8W4ooZcn8QZMi2QFU5wbzEwQERYs2ub2/bz9E0rjaCpWFv7r57/qEnOp9INxILF718MT
	vAKaNqRdbnzqXEYdvZN9Gj3jjxO+GYTBeaATXFDUf1ajAyepqXPMorSJAoDFfjgHA6cFnsZdbqqH2
	cAuSja7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzzm5-006Bof-HX; Sun, 04 Jul 2021 10:54:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzzm4-006BoY-9t
 for linux-riscv@bombadil.infradead.org; Sun, 04 Jul 2021 10:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=IJWoPsNqCtoDOR3Xg0CLQhgbBNrsLnX9XDMGYven8d8=; b=GsMRR59+TJMHxVz0niQo2LWg/X
 jZNac4goWCYBhDp8LozD5EZJ/xql4WA5UTd7N+LCRyLoZHNrhfV4j5TIy4LFoJybqrwvxwVxzoOT0
 nVekw4fWzAcIzPPMN8llhm/HqXSLkekaB7Zlp6hicqbPXupwWAELXLUYlxCBtC9ftrzStp/U5yWAR
 VqiDYnBtNxqt6LEiUE20VnON+LzH4OEQRIIzDLOUHlMTboQHJmp8Pn38eTRUp8sgOI3OM1hqnqAN9
 mh32o+H1NlQc0MuYgB0tI2Htqnfo2NANUgNxHK/vDS0XlNkXNH6SbkFi+srO0l4OShblqx/wATJX2
 H8ExzjVw==;
Received: from smtpbg516.qq.com ([203.205.250.54])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzzlu-00EOeF-RK
 for linux-riscv@lists.infradead.org; Sun, 04 Jul 2021 10:54:53 +0000
X-QQ-mid: bizesmtp39t1625396049te5h6wip
Received: from [0.0.0.0] (unknown [104.168.173.65])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 04 Jul 2021 18:54:05 +0800 (CST)
X-QQ-SSF: 01400000000000B0G000B00A0000000
X-QQ-FEAT: PLsv2YTDsz6fkLksvvXVSrLacZZFMcsLrDP6NmVSh+y225ytuxQy7yhEjoqmp
 kAbz6tNqitcDlOxC+VTXQoWdbm8NzjmNKvAdvgJriYfog2Ivc7b555mreqLnXL8dXyFQd2t
 Bqnk9yr4QgzlYy6IAE6II/Ujet/4VgT4t51bQh+tDVMXVFJ+YkV27kBayWsy7EvzFne6nZ/
 eJ3sybPAMDaMtLMoIArjOLID1zmrYpV/8QylAy869KxtvV1TvGA3XalIYc+GsAT72/iF4AA
 fr8a1/HQgq3lEHd7+pqPkuzr3t/5MHIHNVBy+tjW9ZPHZ2eLOf5CyuYT0/BeiaYwTKmUW2n
 KCN3jvTG2PBXgmFaVqDSDedlfDKQA==
X-QQ-GoodBg: 2
Subject: Re: [PATCH] riscv: dts: fix memory size for the SiFive HiFive
 Unmatched
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
 <CAMuHMdU+GXCm1RbKriLSyLoV3XCZPDWjMHBuZrZ-i+Q7070ddg@mail.gmail.com>
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Message-ID: <f23711df-4357-f405-1672-5ce2fee6f093@kylinos.com.cn>+1369CD14037484FC
Date: Sun, 4 Jul 2021 18:54:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU+GXCm1RbKriLSyLoV3XCZPDWjMHBuZrZ-i+Q7070ddg@mail.gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_115447_406088_70B1FF58 
X-CRM114-Status: GOOD (  13.70  )
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

SGkgR2VlcnQsCgoKSXQgaXNuJ3QuIFRoZSBvZmZpY2lhbCBTRCBjYXJkIGltYWdlIGZyb20gU2lG
aXZlIHBhc3NlcyBEVEIgdGhyb3VnaCAKZXh0bGludXguY29uZi7CoCBBbmQgdGhlIERUQiBjYW4g
YmUgYW4gZXh0ZXJuYWwgRFRCIGluc3RhbGxlZCB1bmRlciB0aGUgCi9ib290IHBhcnRpdGlvbi4g
SSBnb3QgOEdCIG1lbW9yeSBhdmFpbGFibGUgd2l0aG91dCB0aGlzIHBhdGNoIGFwcGxpZWQuCgoK
VGhhbmtzLAoKUWl1CgoKT24gNy80LzIxIDY6MjcgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToKPiBIaSBRaXUsCj4KPiBPbiBTdW4sIEp1bCA0LCAyMDIxIGF0IDEwOjM3IEFNIFFpdSBXZW5i
byA8cWl1d2VuYm9Aa3lsaW5vcy5jb20uY24+IHdyb3RlOgo+PiBUaGUgcHJvZHVjdGlvbiB2ZXJz
aW9uIG9mIEhpRml2ZSBVbm1hdGNoZWQgaGF2ZSAxNkdCIG1lbW9yeS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogUWl1IFdlbmJvIDxxaXV3ZW5ib0BreWxpbm9zLmNvbS5jbj4KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghCj4KPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVu
bWF0Y2hlZC1hMDAuZHRzCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2
ZS11bm1hdGNoZWQtYTAwLmR0cwo+PiBAQCAtMjQsNyArMjQsNyBAQCBjcHVzIHsKPj4KPj4gICAg
ICAgICAgbWVtb3J5QDgwMDAwMDAwIHsKPj4gICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9
ICJtZW1vcnkiOwo+PiAtICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDgwMDAwMDAwIDB4MiAw
eDAwMDAwMDAwPjsKPj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDQg
MHgwMDAwMDAwMD47Cj4+ICAgICAgICAgIH07Cj4+Cj4+ICAgICAgICAgIHNvYyB7Cj4gVGhlIC9t
ZW1vcnkgbm9kZSBpcyB1cGRhdGVkIGJ5IFUtQm9vdCBiZWZvcmUgcGFzc2luZyBpdCB0byB0aGUg
a2VybmVsCj4gYW55d2F5LCByaWdodD8KPgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
