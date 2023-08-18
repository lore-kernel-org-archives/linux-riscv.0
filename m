Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9059AC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5pFWCaSlEKQ+cNZyIeNyRVYjP952w2vD2AedgFmIBc=; b=3c32ZPnvS5NZwR
	Ahvur9CT16J04qMRu0VizsZSIOj8beIc+YDEYTjnfZEBEL1hjdTLf7fM4wy8tMVwGpKGZRTqQeyYr
	SXRkElONOsrWiLy8yQHDN0UjBMClpyyck6ke48ZS8CRc2CaQztdCZMVwhe2AwIKs1ZBn795M5j6Xp
	4owCtTdrw4F0q5re+yUuXR9kVLWSQUz0olVyfSBk4l8vC4vyxrTTeZXq2XihtmxRR7naSQ+BnA0e7
	PjWxqmKjfNX3vB0No8/4mviC4Gp+GZqfR/7CMkkUKi4mu2I59gYJ6bhWcJVPioK0ldxYBIySLxbsJ
	5PwIoajSfNzDqtAkiB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvq4-0086Kz-2j;
	Fri, 18 Aug 2023 09:32:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvq2-0086Ju-2i
	for linux-riscv@bombadil.infradead.org;
	Fri, 18 Aug 2023 09:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o3pLzBgYSWjCd6thfmwAk/5Fns9ziUkylcZdnTAxXeg=; b=Aufy7f6hqV4ByIrjLx6khmETU4
	zIpk7j7OE/r79VVFpTRP5xOMPSXIeeE5unIuHxLTd5bNRWSNiQeFpxDIqWaMcrx1r9/UOZHyOMlmv
	QpUvvrzN2ZmrXCiDF/lZJUOF276+IiGaS+kA9FPJorgGY/3hU9a8RzyWyg6JQGPYnvpEbbgZCmWk0
	X+ZHreK3kkEwUukIa4lnd127uJfItcRRgZ5CHAzmw4R7p8f/9CrfWfaDfyPtDewwPgGzrgWyuQMBn
	gLj28wPy9iXPRWAU4pESklvFqtNb1X1hXFKLyjs1SzgxgGmnQDa455SrPxLMUQlyhDSuK2ptgF86l
	4XTAiUPA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWvpw-00FNsI-35
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 09:32:12 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8Cxc_CNOt9k8dQZAA--.53098S3;
	Fri, 18 Aug 2023 17:31:57 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax98x3Ot9kTIJdAA--.12208S3;
	Fri, 18 Aug 2023 17:31:55 +0800 (CST)
Message-ID: <8ffb3525-487e-20b3-4024-66470f1407f1@loongson.cn>
Date: Fri, 18 Aug 2023 17:31:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230817220853.GA328159@bhelgaas>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230817220853.GA328159@bhelgaas>
X-CM-TRANSID: AQAAf8Ax98x3Ot9kTIJdAA--.12208S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JryDGFy5WrWDXrWfZw17XFc_yoWDWrX_CF
	W3GFW5C3y8CFsYqa1rGFsxCFn0k39xZF1rZF10qrnFva4rG3Z8Xa92g3s2vr1rJFWFkrnF
	9Fy7Grn5X342gosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vA
	pUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_103209_696862_1F9EBA0F 
X-CRM114-Status: GOOD (  10.29  )
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

SGksCgoKT24gMjAyMy84LzE4IDA2OjA4LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+PiBUaGlzIHBh
dGNoIG1ha2VzIHRoZSB2Z2FfaXNfZmlybXdhcmVfZGVmYXVsdCgpIGZ1bmN0aW9uIHdvcmtzIG9u
IHdoYXRldmVyCj4+IGFyY2ggdGhhdCBoYXMgVUVGSSBHT1Agc3VwcG9ydC4gQnV0IHdlIG1ha2Ug
aXQgYXZhaWxhYmxlIG9ubHkgb24gcGxhdGZvcm1zCj4+IHdoZXJlIFBDSSByZXNvdXJjZSByZWxv
Y2F0aW9uIGhhcHBlbnMuIGlmIHRoZSBwcm92aWRlZCBtZXRob2QgcHJvdmVzIHRvIGJlCj4+IGVm
ZmVjdGl2ZSBhbmQgcmVsaWFibGUsIGl0IGNhbiBiZSBleHBhbmRlZCB0byBvdGhlciBhcmNoIGVh
c2lseS4KPj4KPj4gdjI6Cj4+IAkqIEZpeCB0ZXN0IHJvYm90IHdhcm5uaW5ncyBhbmQgZml4IHR5
cG9zCj4+Cj4+IHYzOgo+PiAJKiBGaXggbGlua2FnZSBwcm9ibGVtcyBpZiB0aGUgZ2xvYmFsIHNj
cmVlbl9pbmZvIGlzIG5vdCBleHBvcnRlZAo+Pgo+PiB2NDoKPj4gCSogSGFuZGxlIGxpbmthZ2Ug
cHJvYmxlbXMgYnkgaGlkaW5nIGJlaGluZCBvZiBDT05GSUdfU1lTRkIsCj4+IAkqIERyb3Agc2lk
ZS1lZmZlY3RzIGFuZCBzaW1wbGlmeS4KPiBUaGUgdjIsIHYzLCB2NCBjaGFuZ2Vsb2cgaXMgbmlj
ZSwgYnV0IHdlIGRvbid0IG5lZWQgaXQgaW4gdGhlIGNvbW1pdAo+IGxvZyBpdHNlbGYsIHdoZXJl
IGl0IHdpbGwgYmVjb21lIHBhcnQgb2YgdGhlIGdpdCBoaXN0b3J5LiAgSXQgc2hvdWxkCj4gZ28g
aW4gYSBjb3ZlciBsZXR0ZXIgb3IgYWZ0ZXIgdGhlICItLS0iIG1hcmtlcjoKPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD12Ni4w
I242NzgKClRoYW5rcyBmb3IgcG9pbnQgaXQgb3V0LCBub3cgSSBrbm93LiBXaWxsIGJlIGZpeGVk
wqBhdCB0aGUgbmV4dCB2ZXJzaW9uLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
