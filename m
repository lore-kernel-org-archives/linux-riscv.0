Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC464C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 01:27:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890E861042
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 01:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 890E861042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bhwwvpbq34pBr640ctA09BKk04XwhpnhOtgTPLBNuWs=; b=nluu6O53UeJf25fYPUTXlZFd+8
	GAmLWj/jYT4ElUNEES1nGCwocRvHML3fA/YtJGd/iO3DjVjMxB/e20j4q+ZiFiViKpWH0zoyNwVC/
	iiZPYpfjSKGD69dU+rXV2P9Fz2VqDwQl/XetkvMrd97bNtu0WWQf4sPuI7pswmZ2QdqLlHwHl+3sW
	d79f2OL30wG/lpWoOyK1gktybDCGuhm7WT5HdpvtdL/UsdxFjS5w8Y08AvHjpKbpQNcc6YGPdFIp2
	ybRymFBNJjAw+i5Q2N5iUN8FtH2r1kLQA/crd2pKuH6YDQuJ/fiD1kyZzNsr2PzERaohRxiN9y6pK
	EfnPUdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYeeu-001C9w-NQ; Fri, 08 Oct 2021 01:26:48 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYees-001C9W-B5
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 01:26:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6583190pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 18:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pJpdSjWQ9J57N/lwk0QG5s7Kp9DIqFcdVWHLvvYpJjI=;
 b=s+MMrKGNGrHx6bfFOUqPVOd5XD+gv5OM/LYiNgY6bbTSNhbQnxrQxAtjMVMo4yOXLk
 xcm1nQK4WnIakev01IJ3xAi3TfIiJhXioq85IKrwOraUw/MRHLJAwvPLS+tJsnwtPoii
 2lzDV8nfm69rq+LDi7d6jbmo+qWmqZ6efgIm7b23ZDi7BnOQJIJdJHURPLUtNd++IefB
 jk5Ix9vRfUWwQr6kEJuJuFlqHiQvrQQE+jjCjZS96nPCR/lLSTIzEzdRZ+/UYyLkrQ5P
 0pi81mRSl+pbqNRn/5xupNOcKOUEktMaNvJGzFGDb7oo7BnWam5kDsiwkoSguzvtSmoq
 zbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pJpdSjWQ9J57N/lwk0QG5s7Kp9DIqFcdVWHLvvYpJjI=;
 b=HolZz3O0GWok3GiNJFpniNmkRPWrdV/VoAjZLtgtfQXqzat/hdsDMdMljmeNnYNA4l
 fVB4PcY2miwUN88Rle67AjEyAGzO2UZLTWIL0dSXv8ijWU0E8HFDAY7iNuSGn8ckj+hC
 mDwikjahBZQo0Uyla7/2KqzQG/PWPeRdMk7tC8CuLSOxKuhocYMa39ZjlOQ0NjA9Iv1o
 LuvuCQ4NmtxRPTsm5hRm7vK3KeFpyyFyZpTTS1q1CqGj4+7HiqLMCda3pYY3j+ZWkbN1
 aEeLO37ueypqkrl14tb96cUx2IdPOJ4O8e+ufvFI0dbuQqV1toTVdwH7ABRk4kzFVb9E
 yFDg==
X-Gm-Message-State: AOAM531PyGO7qYhXM2QVhOaXzCuuotTD5RInqoNHtxwa6CCgujaMinby
 6F57LDSoCLv5O10fhMUTuygdcQLOwUzDXg==
X-Google-Smtp-Source: ABdhPJzZ9dgVXzRUrfgOj4y/IRYM+8rBocqvbuvdJzKL3LpgbfM2wLjbp9eqPdRWxci8d3kehbgMWA==
X-Received: by 2002:a17:90a:62ca:: with SMTP id
 k10mr8475031pjs.38.1633656405198; 
 Thu, 07 Oct 2021 18:26:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x9sm9478349pjp.50.2021.10.07.18.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 18:26:44 -0700 (PDT)
Date: Thu, 07 Oct 2021 18:26:44 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Oct 2021 18:26:33 PDT (-0700)
Subject: Re: [PATCH v4 0/3] riscv: optimized mem* functions
In-Reply-To: <20210919192104.98592-1-mcroce@linux.microsoft.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 Atish Patra <Atish.Patra@wdc.com>, kernel@esmil.dk, akira.tsukamoto@gmail.com,
 drew@beagleboard.org, 
 bmeng.cn@gmail.com, David.Laight@aculab.com, guoren@kernel.org,
 Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mcroce@linux.microsoft.com
Message-ID: <mhng-1ef62a9c-06e5-43cf-a4ec-8c18111e79d3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_182646_405687_9D351BA3 
X-CRM114-Status: GOOD (  21.68  )
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

T24gU3VuLCAxOSBTZXAgMjAyMSAxMjoyMTowMSBQRFQgKC0wNzAwKSwgbWNyb2NlQGxpbnV4Lm1p
Y3Jvc29mdC5jb20gd3JvdGU6Cj4gRnJvbTogTWF0dGVvIENyb2NlIDxtY3JvY2VAbWljcm9zb2Z0
LmNvbT4KPgo+IFJlcGxhY2UgdGhlIGFzc2VtYmx5IG1lbXtjcHksbW92ZSxzZXR9IHdpdGggQyBl
cXVpdmFsZW50Lgo+Cj4gVHJ5IHRvIGFjY2VzcyBSQU0gd2l0aCB0aGUgbGFyZ2VzdCBiaXQgd2lk
dGggcG9zc2libGUsIGJ1dCB3aXRob3V0Cj4gZG9pbmcgdW5hbGlnbmVkIGFjY2Vzc2VzLgo+Cj4g
QSBmdXJ0aGVyIGltcHJvdmVtZW50IGNvdWxkIGJlIHRvIHVzZSBtdWx0aXBsZSByZWFkIGFuZCB3
cml0ZXMgYXMgdGhlCj4gYXNzZW1ibHkgdmVyc2lvbiB3YXMgdHJ5aW5nIHRvIGRvLgo+Cj4gVGVz
dGVkIG9uIGEgQmVhZ2xlViBTdGFybGlnaHQgd2l0aCBhIFNpRml2ZSBVNzQgY29yZSwgd2hlcmUg
dGhlCj4gaW1wcm92ZW1lbnQgaXMgbm90aWNlYWJsZS4KPgo+IHYzIC0+IHY0Ogo+IC0gaW5jb3Jw
b3JhdGUgY2hhbmdlcyBmcm9tIHByb3Bvc2VkIGdlbmVyaWMgdmVyc2lvbjoKPiAgIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTA2MTcxNTI3NTQuMTc5NjAtMS1tY3JvY2VAbGludXgu
bWljcm9zb2Z0LmNvbS8KPgo+IHYyIC0+IHYzOgo+IC0gYWxpYXMgbWVtKiB0byBfX21lbSogYW5k
IG5vdCB2aWNldmVyc2EKPiAtIHVzZSBfX2FsaWFzIGluc3RlYWQgb2YgYSB0YWlsIGNhbGwKPgo+
IHYxIC0+IHYyOgo+IC0gcmVkdWNlIHRoZSB0aHJlc2hvbGQgZnJvbSA2NCB0byAxNiBieXRlcwo+
IC0gZml4IEtBU0FOIGJ1aWxkCj4gLSBvcHRpbWl6ZSBtZW1zZXQKPgo+IE1hdHRlbyBDcm9jZSAo
Myk6Cj4gICByaXNjdjogb3B0aW1pemVkIG1lbWNweQo+ICAgcmlzY3Y6IG9wdGltaXplZCBtZW1t
b3ZlCj4gICByaXNjdjogb3B0aW1pemVkIG1lbXNldAo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3RyaW5nLmggfCAgMTggKystLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAg
IHwgICAxIC0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcmlzY3Zfa3N5bXMuYyB8ICAxNyAtLS0tCj4g
IGFyY2gvcmlzY3YvbGliL01ha2VmaWxlICAgICAgICAgfCAgIDQgKy0KPiAgYXJjaC9yaXNjdi9s
aWIvbWVtY3B5LlMgICAgICAgICB8IDEwOCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gv
cmlzY3YvbGliL21lbW1vdmUuUyAgICAgICAgfCAgNjQgLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jp
c2N2L2xpYi9tZW1zZXQuUyAgICAgICAgIHwgMTEzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IGFyY2gvcmlzY3YvbGliL3N0cmluZy5jICAgICAgICAgfCAxNTQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAxNjQgaW5zZXJ0aW9ucygrKSwgMzE1
IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcmlz
Y3Zfa3N5bXMuYwo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvbWVtY3B5LlMK
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGliL21lbW1vdmUuUwo+ICBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvbWVtc2V0LlMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3YvbGliL3N0cmluZy5jCgpUaGFua3MuICBUaGVzZSBnZW5lcmFsbHkgbG9vayBn
b29kLCBidXQgdGhleSdyZSBmYWlsaW5nIHRvIGJ1aWxkIGZvciBtZS4gIApJJ20gZ2V0dGluZyBl
cnJvcnMgYWxvbmcgdGhlIGxpbmVzIG9mCgogICAgYXJjaC9yaXNjdi9saWIvc3RyaW5nLmM6ODk6
NzogZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIOKAmGFsd2F5c19pbmxpbmXigJkg
4oCYbWVtY3B54oCZOiBmdW5jdGlvbiBib2R5IGNhbiBiZSBvdmVyd3JpdHRlbiBhdCBsaW5rIHRp
bWUKICAgICAgIDg5IHwgdm9pZCAqbWVtY3B5KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywg
c2l6ZV90IGNvdW50KSBfX3dlYWsgX19hbGlhcyhfX21lbWNweSk7ICAgICAgfCAgICAgICBefn5+
fn4KICAgIGFyY2gvcmlzY3YvbGliL3N0cmluZy5jOjk5OjEwOiBub3RlOiBjYWxsZWQgZnJvbSBo
ZXJlCiAgICAgICA5OSB8ICAgcmV0dXJuIG1lbWNweShkZXN0LCBzcmMsIGNvdW50KTsKICAgICAg
ICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpJJ20gc3RpbGwgYSBiaXQg
YmVoaW5kIG9uIGVtYWlsIHNvIEknbSBnb2luZyB0byBrZWVwIGdvaW5nIHRocm91Z2ggCnBhdGNo
ZXMsIGJ1dCBpZiB0aGVyZSdzIG5vIHY1IGJ5IHRoZSB0aW1lIEkgZ2V0IGJhY2sgaGVyZSB0aGVu
IEknbGwgdGFrZSAKYSBsb29rLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
