Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A598C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 14:11:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7D360190
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC7D360190
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kWxUVz4RQ9CfWOoQUoDstmQd1WuPlb2Hcaol0PHME3k=; b=TKXSs4ibrQfX+J
	u03Hn/VqxJTaLxqOSKzXg6EulZoSebZ9LsKksc21CsTcUq9k+y2OL9O5A16S95BKe05l4hUiYFClE
	yjkFDXx8njTCEnsjQus6JEMFjMH66XDGoiDs5bxo54Ii6wl+kaxHO3GiDRip8kB8yCI156jdFw8sG
	zLG08CmEYMk0wfBwZEorirUTEwPC1zZRJVMfRbILqBot1Bwbcxs65q8GkGmRYccjYT+fqJVcnRE4z
	uxjZnsdW1obrrfAK6hUbn8bW/mziZIN5NEYIJCE7nht3OyyZ6ldykgpPXApLdsMKygofWL5JmmQI7
	W4fY4Q51T/FDg95QaYSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxHr-006vm8-5E; Mon, 12 Apr 2021 14:11:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxHo-006vlr-QI
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 14:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=LyMpiFFacUavxR3XXH9WRPmV1fccauTSHw9uR2aH4XU=; b=x7OBhEcxlt0RILyr+ResKBZnAA
 CGEumg7S/X4myrFqzHJyMSQuwMdEDbbYXkKUJ6tExr0p4sYdSSsT7K0rha7GaA6Vn0hx+0bv1CeyW
 gM/GLDS7awmKPxcWBMUSPDGqv67irdkd+aYlyAokbnqA8PXQ9wF/vzo4TFiOUh8WWZ002FM8Zz8eD
 egOKzhJZe4rfQ2C2Eq8/qgZH8lNygqA0rxysPpsC19gf21rrpsVNPiSYuQTDSZ4BW1sCLjz0AJz/C
 mQKAckr6GFioJrC+8xmRvkIrGweNK4ys/iIvzoHLDh3XOvWXX/+gC2okSqyy1ehqoIgY/zdkrd8wp
 rYnyWEbg==;
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxHm-006IHn-39
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 14:11:31 +0000
Received: by mail-oi1-x232.google.com with SMTP id k18so8634154oik.1
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=LyMpiFFacUavxR3XXH9WRPmV1fccauTSHw9uR2aH4XU=;
 b=Yr28PF6PgaHzl5uloWwfUu1rsY2ar9rkNs+alw1mqSQixsTgsOddok98W67AK6PqdO
 FXXVSdt0JD7B8/GuibVYxoZGuH0LSh9AXo4fbG5hk/AqoIVH0Nmok8zOrV57Xdjzi710
 kCpkV1RqYIoxP62E3PZX21hSzFQhsVsYafCHUQv49BvnQpaK+46QZn9M9XC5AahAkYJS
 q/IfOsEXmvujNuuZ5zgb1reGVb0ruOhiaTd90YnSMfcRmTORf2QphqkvApFxCJKuO7ox
 fn0PSbYyJfHz/kC4WIM22UbvGXNN8h8YKiy4bMF3/O/a6WjSd+8qfc1rngxYhH5r3YXs
 QdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=LyMpiFFacUavxR3XXH9WRPmV1fccauTSHw9uR2aH4XU=;
 b=RMyJKAnN5+yZdTO/ODP059m5X3Sk5Cc/oMhDZipvwL58cDR0WPyX37doCZ0frnT/pO
 WnuH3GjQ57u9AIRW9/fpZ2AA1YBPEGXOE+qzpGjXxZPxPlChVHIstkFMxb3ZEeqnE8ej
 tAUPJ5/Dok7v6qBB5rB1TDDiD82cOZLdV815e500RaqSNTjBPihKtly2/+i5H9qJb4r+
 Drygczn81Eygg3xzEo8HxmMyu319lJjX6kOv10Kw1hfCxCJScyFXAXzpL6oSqXOfnuQD
 MQF0B4CLmgkskiTSzlu10Y88Gwc/XsceMGpBfxF+yHZi4P6ZNPyiN55GD9rnzy5B01Tf
 fl8g==
X-Gm-Message-State: AOAM530pKQorImJE8xM+mzXnYOcd7SPkClIhL/zbFr2ONedF+eTvjk/J
 a9PpxjzgOqwmisewXrq9Q7infsmRFk10dA==
X-Google-Smtp-Source: ABdhPJx3uKNei4RIlJoThUIp5fXlitgFEulMeC9g/yKAXenmqPafXaIILvuyqUPAUueUezKGyvvjPg==
X-Received: by 2002:aca:ea8a:: with SMTP id i132mr19362367oih.68.1618236687733; 
 Mon, 12 Apr 2021 07:11:27 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175])
 by smtp.gmail.com with ESMTPSA id h10sm1489720otm.11.2021.04.12.07.11.26
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 07:11:27 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id x77so4159386oix.8
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 07:11:26 -0700 (PDT)
X-Received: by 2002:aca:4188:: with SMTP id o130mr20076317oia.53.1618236686349; 
 Mon, 12 Apr 2021 07:11:26 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Mon, 12 Apr 2021 11:11:14 -0300
X-Gmail-Original-Message-ID: <CADnnUqfOfDSb3yACo+WcEtLqWvfKw9p0PgCHV=gj94k0SyC6KA@mail.gmail.com>
Message-ID: <CADnnUqfOfDSb3yACo+WcEtLqWvfKw9p0PgCHV=gj94k0SyC6KA@mail.gmail.com>
Subject: Cross-building Kernel packages for linux-headers adds x86 binaries
To: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_071130_221245_C394C05F 
X-CRM114-Status: GOOD (  10.27  )
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

SSd2ZSBiZWVuIGNyb3NzLWJ1aWxkaW5nIC5kZWIgS2VybmVsIHBhY2thZ2VzIGFuZCByZWNlbnRs
eSB0cmllZCB0bwpidWlsZCBhbiBleHRlcm5hbCBtb2R1bGUgdXNpbmcgZGttcwooaHR0cHM6Ly9n
aXRodWIuY29tL2duYWIvcnRsODgxMmF1KS4KCkkgc2F3IGFuIGVycm9yIHRoYXQgdGhlIGJ1aWxk
IHByb2Nlc3MgY29tcGxhaW5lZCBhYm91dCBmaXhkZXAgYW5kCmxhdGVyIG1vZHBvc3QuIFdoZW4g
SSBsb29rZWQgaW50byBpdCB0aGV5IHdlcmUgeDg2IGJpbmFyaWVzIGFuZCBub3QKcmlzY3Ygb25l
cy4gSSBiZWxpZXZlIHRoZSBjcm9zcy1idWlsZCBwcm9jZXNzIGRvZXNuJ3QgYWRkIHRoZXNlIGFz
CnRhcmdldCBiaW5hcmllcy4KCk15IGJ1aWxkIGNvbW1hbmQgaXM6IG1ha2UgQ1JPU1NfQ09NUElM
RT1yaXNjdjY0LXVua25vd24tbGludXgtZ251LQpBUkNIPXJpc2N2IElOU1RBTExfTU9EX1NUUklQ
PTEgLWpgbnByb2NgIGJpbmRlYi1wa2cKCuKdryBmaWxlIHNjcmlwdHMvYmFzaWMvZml4ZGVwCnNj
cmlwdHMvYmFzaWMvZml4ZGVwOiBFTEYgNjQtYml0IExTQiBwaWUgZXhlY3V0YWJsZSwgeDg2LTY0
LCB2ZXJzaW9uIDEKKFNZU1YpLCBkeW5hbWljYWxseSBsaW5rZWQsIGludGVycHJldGVyIC9saWI2
NC9sZC1saW51eC14ODYtNjQuc28uMiwKQnVpbGRJRFtzaGExXT1mYzViOTNmYTA2OGJiMDJjYTZm
YTFmMWUyZWViOTlmYTc0YTE5Yzg0LCBmb3IgR05VL0xpbnV4CjMuMi4wLCBub3Qgc3RyaXBwZWQK
ClRoZW4gSSB0cmllZCB0byByZWJ1aWxkIHRoZW0gdXNpbmcgInN1ZG8gbWFrZSBzY3JpcHRzIiBp
bgovdXNyL3NyYy9saW51eC1oZWFkZXJzLSQodW5hbWUgLXIpIGFuZCBnb3Q6Cgrina8gc3VkbyBt
YWtlIHNjcmlwdHMKICBTWU5DICAgIGluY2x1ZGUvY29uZmlnL2F1dG8uY29uZi5jbWQKc2NyaXB0
cy9rY29uZmlnL2NvbmY6IDMwOiBTeW50YXggZXJyb3I6ICIoIiB1bmV4cGVjdGVkCm1ha2VbMl06
ICoqKiBbc2NyaXB0cy9rY29uZmlnL01ha2VmaWxlOjcxOiBzeW5jY29uZmlnXSBFcnJvciAyCm1h
a2VbMV06ICoqKiBbTWFrZWZpbGU6NjAyOiBzeW5jY29uZmlnXSBFcnJvciAyCm1ha2U6ICoqKiBb
TWFrZWZpbGU6NzEwOiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYuY21kXSBFcnJvciAyCgpJbiB0
aGUgZW5kIEkndmUgY2xvbmVkIHRoZSBmdWxsIEtlcm5lbCB0cmVlIGFuZCBidWlsdCB0aGUgc2Ny
aXB0cwptYW51YWxseSwgcmVwbGFjaW5nIHRoZW0gaW4gdGhlCi91c3Ivc3JjL2xpbnV4LWhlYWRl
cnMtJCh1bmFtZSAtcikuIEl0IHdvcmtlZC4KCkFueSB0aXBzIG9uIGhhdmluZyB0aGUgY29ycmVj
dCBhcmNoIGJpbmFyaWVzIGluIHRoZSBsaW51eC1oZWFkZXJzCnBhY2thZ2Ugb3Igd2hhdCBjb3Vs
ZCBiZSB3cm9uZyBpbiB0aGUgcmVidWlsZCAibWFrZSBzY3JpcHRzIiBjb21tYW5kPwoKVGhhbmtz
IQotLSAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDYXJsb3MgRWR1
YXJkbyBkZSBQYXVsYQptZUBjYXJsb3NlZHAuY29tCmh0dHA6Ly9jYXJsb3NlZHAuY29tCmh0dHBz
Oi8vdHdpdHRlci5jb20vY2FybG9zZWRwCmh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9pbi9jYXJs
b3NlZHAvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
