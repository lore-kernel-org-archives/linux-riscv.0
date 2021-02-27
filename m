Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49695C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 05:26:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC6464EBC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 05:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EC6464EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=i8vT5Ec7uLKELu+kelr9jY8Jk0RAduecie8R44kVXLk=; b=j9PsTAgkeDZn55fZVcALWHXjl
	QSpHW3jOLSJXUiS5m/yYPnfMQG8A5zvPSq8ALKk9FrKupfxoPNgUNTcWMm7nbs5LcnxvIy5tQbRNm
	ii/n644GuEn2YtzDS8Ar9GRo3ES9EKblLyup52pEUwPks9qOEs2zXlldBjuLZCdxrm20XKCDGsdnp
	JFXqcXZF9fRU/uZ7XMI0ZaHhUzPYoYbLoWa9Em1fWPv1v8VNe/QQB5R7IFumHqQvNi/Jcf9u++7c5
	4s+CLhACyCaJv1qOXg31GW10tX06pcCKw2u24yo4ms7aaPmhs3lXxbs9NPTejFjDT+VO+L21JLZ+G
	y4dm+F6vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFs7G-0004ya-8g; Sat, 27 Feb 2021 05:26:10 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFs7D-0004y6-IV
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 05:26:08 +0000
Received: by mail-pg1-x531.google.com with SMTP id p21so7518321pgl.12
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 21:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xk2OjLKW75K6yzkgMChHnPcuKyz+GvIgLptVqCA6IY0=;
 b=svnjHt3AwEo8FFx5NpNzJElvtiy+8aHILtitkd9OOF+IpKu3R55UuwoSdCfzSjgKdv
 Tx0UpsWGTafXTdwKPL/HuKZ6Z+jNBp8Diw6i3ppGGg+IUZfb+hANN9z/PaIGCQNFBW+Y
 HEjhpJ4YkcX2NCxBok1BmMMzxFaWGXltV6Sq5/6cOlkS/d6so8In0GGSYLVRZ9D3WVyH
 Rvf5WYlzBRcAqNBH0dKpm3TmLgiP89EYSFOnPjxn2yWj0vyKuXPQwPN/vOo+7hJ1nxVg
 K2qmwoxjuPKk4jNnqCI1QO5aMebRVbuHfhBBo+FWwtApczelQw/y8qwtm7EX46uTUTYf
 j7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xk2OjLKW75K6yzkgMChHnPcuKyz+GvIgLptVqCA6IY0=;
 b=Pmu4U4SeT9Fn+ZHuzuOSp5EZT/aOyW7WQKw1sbUXVxI12+aBQSFgKrlWNtbL2HfzMB
 x9cLpgdU9JcGalA4igQuNnCF2JyUuejqwQt8eE98nUug0N2EkEQ3l6OnuzY71y9sX0b4
 9dYf+W9hq+N2Z9+wsyv986u1YAxR0UqEc0SKqvITYTLzr+CWy0T9hvYeJfCOGGhBMA5n
 cw4aMrL9MGdJET7xsn2tj0SZsOvi9u6p26PWOVq+qMwfF7Gh71YsPm052IxUbMwD7YPB
 E5J6sYVLONxxx9hbwzo/icvmx/SbP0fnlTX18xfZscezMrKSN9TrPyh/ka6MUn57TwO5
 xkUA==
X-Gm-Message-State: AOAM533xEoz72NU5xoPfdg8WdzWqgimLOLNS/9ddya6Omg28HOjQNPIt
 ox6M6jRZAS2kODsDaoGidwy8vnGPHbJ+xw20
X-Google-Smtp-Source: ABdhPJwrXoWp0wWicmlWaZ/JhVqG9cODsJeSmWchQ72mRvjAp8Kak8Y8iyNkVNDAINWIXbGOzjv28Q==
X-Received: by 2002:a65:5c48:: with SMTP id v8mr5864150pgr.400.1614403565227; 
 Fri, 26 Feb 2021 21:26:05 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 72sm10810230pfv.5.2021.02.26.21.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 21:26:04 -0800 (PST)
Date: Fri, 26 Feb 2021 21:26:04 -0800 (PST)
X-Google-Original-Date: Fri, 26 Feb 2021 21:26:02 PST (-0800)
Subject: Re: [PATCH v2] riscv: Cleanup setup_bootmem()
In-Reply-To: <ac23c2d9-f102-00be-25d9-b05712f17ee0@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-77437838-b5f9-408a-b23e-3255cf67465f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_002607_768137_0D2EFF90 
X-CRM114-Status: GOOD (  14.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNiBGZWIgMjAyMSAxNzoyMTowMCBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4KPiBPbiAyMDIxLzIvMTkgMTU6MTUsIFBhbG1lciBEYWJiZWx0
IHdyb3RlOgo+PiBPbiBNb24sIDA4IEZlYiAyMDIxIDE3OjAxOjUxIFBTVCAoLTA4MDApLCB3YW5n
a2VmZW5nLndhbmdAaHVhd2VpLmNvbQo+PiB3cm90ZToKPj4+IEFmdGVyIHRoZSBmb2xsb3dpbmcg
cGF0Y2hlcywKPj4+Cj4+PiDCoCBjb21taXQgZGUwNDNkYTBiOWU3ICgiUklTQy1WOiBGaXggdXNh
Z2Ugb2YKPj4+IG1lbWJsb2NrX2VuZm9yY2VfbWVtb3J5X2xpbWl0IikKPj4+IMKgIGNvbW1pdCAx
YmQxNGE2NmVlNTIgKCJSSVNDLVY6IFJlbW92ZSBhbnkgbWVtYmxvY2sgcmVwcmVzZW50aW5nCj4+
PiB1bnVzYWJsZSBtZW1vcnkgYXJlYSIpCj4+PiDCoCBjb21taXQgYjEwZDZiY2E4NzIwICgiYXJj
aCwgZHJpdmVyczogcmVwbGFjZSBmb3JfZWFjaF9tZW1ib2NrKCkKPj4+IHdpdGggZm9yX2VhY2hf
bWVtX3JhbmdlKCkiKQo+Pj4KPj4+IHNvbWUgbG9naWMgaXMgdXNlbGVzcywga2lsbCB0aGUgbWVt
X3N0YXJ0L3N0YXJ0L2VuZCBhbmQgdW5uZWVkZWQgY29kZS4KPj4+Cj4+PiBSZXZpZXdlZC1ieTog
QXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLZWZl
bmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4+Pgo+IC4uLgo+Pgo+PiBUaGFu
a3MsIHRoaXMgaXMgb24gZm9yLW5leHQuCj4gSGkgUGFsbWVyLCBtYXliZSB0aGlzIG9uZSBpcyBt
aXNzZWQ/CgpTb3JyeSBhYm91dCB0aGF0LCBJJ2xsIHNlbnQgaXQgdXAgdG9tb3Jyb3cuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
