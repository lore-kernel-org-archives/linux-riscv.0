Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5009BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 13:56:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC39D6120F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 13:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC39D6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS+zkIDuKJJO4h7qMsl4CrnYylXSJ1hhMhKBdseJUa0=; b=ufAjFMBw08R7Kb
	C9KMsPLBef42oSwBoSqJLPrIaWS/GX0/EU/XnuVdM6gN6Rw0xXPLoRmlQZPwbq0pro9JbKK2Cx8yb
	NsbtOlwUpl/fYQBQyafv7lTyfcFDEe4XiLCDD2khSEbOEzu1LaZ6vlZsfElnkY95EpW9s4f8ciALX
	fN/tH0OK8WTnKibuX4Ta3dchAgUZmnVl/ysLpt8/TeZEqkAA3hOTMUPbL6DyDrcWbh/2Y0i66/UvB
	2QE8YrRb/YtMt1oWJYso1My6vnkoUxg04TAhXz5qFVBIMgNvNWieST2+Itivv8keQIft9/4rkXHBx
	sJed4KcWTXBZUEz/zZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOKXE-00A2qA-W6; Thu, 09 Sep 2021 13:56:13 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOKXA-00A2o3-U6
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 13:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=AS4GoMNuNsExioqPJiOWEVu+3vDbz3bR3P
 ju384umbs=; b=Q0mP44lKzggbQhiTjNegXyJD4X+EDPSQAEquIo+Ib3iEGvj4eI
 NDlzUEUFl04iFojHsp7XC7RKM482eu2GIYRg/tff3iXi74q9S2ba+HzQJ6gXRSWO
 r5eWgt0Y+2rm5wn77BdY6ur8xEF2nuVkz08cGcd5L1JDelro1wRu7wE8k=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygB3fgJsEjphqk0PAA--.207S2; 
 Thu, 09 Sep 2021 21:55:56 +0800 (CST)
Date: Thu, 9 Sep 2021 21:49:29 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: enable GENERIC_FIND_FIRST_BIT
Message-ID: <20210909214929.7c2b9ae0@xhacker>
In-Reply-To: <bbd220c4-b535-d024-6bd3-b620b4702ed3@huawei.com>
References: <20210718001423.6b8e1d23@xhacker> <20210908230427.3a92fb87@xhacker>
 <bbd220c4-b535-d024-6bd3-b620b4702ed3@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygB3fgJsEjphqk0PAA--.207S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF18GF4DJw1xZrW8Kr4xCrg_yoWkuFX_Wr
 y0y3ykCw4UZrs7Aan8XayavFWqkF48W34ruw4jyrn8XrW3J3y8CF4kWF9aqayrCr40yF4U
 KF9Iv3W5Xr97JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxU2_HUDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_065609_616757_DFDE46D2 
X-CRM114-Status: GOOD (  10.75  )
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

T24gVGh1LCA5IFNlcCAyMDIxIDA4OjU4OjMxICswODAwCktlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IE9uIDIwMjEvOS84IDIzOjA0LCBKaXNoZW5nIFpo
YW5nIHdyb3RlOgo+ID4gSGkgUGFsbWVyLAo+ID4KPiA+IE9uIFN1biwgMTggSnVsIDIwMjEgMDA6
MTQ6MjMgKzA4MDAKPiA+IEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiAgCj4gPj4gRnJvbTogSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4+Cj4gPj4gcmlzY3YgZG9lc24ndCBp
bXBsZW1lbnQgYXJjaGl0ZWN0dXJlLW9wdGltaXplZCBiaXRzZWFyY2hpbmcgZnVuY3Rpb25zCj4g
Pj4gc3VjaCBhcyBmaW5kX2ZpcnN0X3t6ZXJvfV9iaXQoKSBldGMuCj4gPj4KPiA+PiBXaGVuIEdF
TkVSSUNfRklORF9GSVJTVF9CSVQ9biwgZmluZF9maXJzdF9iaXQoKSBpcyBpbXBsZW1lbnRlZCB3
aXRoCj4gPj4gZmluZF9uZXh0X2JpdCgpIHdoaWNoIGlzIGxlc3MgZWZmaWNpZW50LiBFbmFibGUg
R0VORVJJQ19GSU5EX0ZJUlNUX0JJVAo+ID4+IGZvciByaXNjdiB0byBnZXQgbW9yZSBvcHRpbWl6
ZWQgZmluZF9maXJzdF9iaXQoKSBpbXBsZW1lbnRhdGlvbiwgYW4KPiA+PiBpbml0aWFsIHRlc3Qo
bGliL2ZpbmRfYml0X2JlbmNobWFyaykgc2hvd3MgZmluZF9maXJzdF9iaXQoKSBwZXJmb3JtYW5j
ZQo+ID4+IGlzIGltcHJvdmVkIGJ5IG5lYXJseSAzMiUuICAKPiA+IEl0IHNlZW1zIHRoaXMgcGF0
Y2ggaXMgbWlzc2VkLiBJcyBpdCBwb3NzaWJsZSB0byBwaWNrIGl0IHVwIGZvciAybmQgNS4xNS1y
YzEgUFI/Cj4gPgo+ID4gVGhhbmtzICAKPiAKPiBJdCBpcyBlbmFibGVkIHVuY29uZGl0aW9uYWxs
eSBieSBmb2xsb3dpbmcgY29tbWl0Cj4gCj4gY29tbWl0IGRiYmNjZmU1MDVlZjhmYWU4MDQ2Nzdh
YmYwNTY0YzFlMDc0NzkxMDIKPiAKPiBBdXRob3I6IFl1cnkgTm9yb3YgPHl1cnkubm9yb3ZAZ21h
aWwuY29tPgo+IERhdGU6wqDCoCBUdWUgQXVnIDI0IDA5OjU5OjU2IDIwMjEgKzEwMDAKPiAKPiAg
wqDCoMKgIGFyY2g6IHJlbW92ZSBHRU5FUklDX0ZJTkRfRklSU1RfQklUIGVudGlyZWx5Cj4gCgpB
aGEsIHRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiBBZnRlciBZdXJ5J3MgY29tbWl0LCB0aGlz
IHBhdGNoCmlzIHVzZWxlc3Mgbm93LgoKdGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
