Return-Path: <SRS0=+nUN=CI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CC3C433E2
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 08:02:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F5D20714
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 08:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQuqD8Pi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e17tUimt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F5D20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u7pDAK2SpjyUcT/UPt6BHPuLu0UPMJM0Hb96HjXBG9w=; b=gQuqD8PibWm3+JRaYR+TKdaK3
	h7uhEyEdFjdy8j9/bs1QAuarPpc+cGy1HmiTtZ6UejtUpbzD7tYtnBFz8OVJ3GERS2OENw/xXDXYb
	1ditr2aYjTepJDowb52cddMGqqF7lMsqsG5xbwR//Hl0UDjxnoimfhRM3KUkYyagtpPs2CBhLqmDu
	xqvQCNrEA4T7AmsV3jLTloVSDmj/YpavnN9q8iAjwknfcB96DwnzMXYBEuXtYOqgxpAByu8EY3xR+
	AKi8GugAL/IerUhZTCUYYmibpA6AAaI/T2B/zin4appLbaHEePsTuAADSXxztWmM+Q1IbapTZx3w1
	cDK/1vMIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCIHZ-0007gb-So; Sun, 30 Aug 2020 08:01:45 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCIHX-0007g8-LD
 for linux-riscv@lists.infradead.org; Sun, 30 Aug 2020 08:01:44 +0000
Received: by mail-ej1-x642.google.com with SMTP id h4so2921729ejj.0
 for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2020 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/8mkZkNr8MCMt5D6YbG+h46YXVdjKr6kILMxJe8eeQ=;
 b=e17tUimtOqdDOpNkjROCuuIderSWFMKZO8bmgr6bl9Zy7xZjs2vVWoCjw3I7un4Bp0
 vJVh+kX5Hm7sJ+xLxqDAGZcta+FXZEHy2kN2Jkdxw5CYcQsYIt8YpHaWyIAvC3txbFZd
 2QGBYw9bAr/bFQAlP/ECkTafc1hQtvvZ3aZRTmDCb08HAByLFah2J2FlQiUl8f0NK2aS
 catDqxqlUK88PbTeQtgZOLUjllGv/XJSEjT2lq/xLRCzLNxk5MxLKDMf+mu4eTJzWGSo
 IgL3XCQzoFAVO2bqVcXe7bmeE401N4Q/tB4/aJJ79Gx3E9Ace0BfuxsgQNS+t+g6Mac6
 zvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/8mkZkNr8MCMt5D6YbG+h46YXVdjKr6kILMxJe8eeQ=;
 b=HZJhI5+apoK1bOuAZRbYW0zbJ3jvVuvgcFRGvynUMfduwIxOgJXKLiDkuSOpeBE7r8
 FyCcFSy5XyMtXLlU2l0ZURQTOVr/+5tvR5ByIS5ACvPP8Ha6fA6o/RTIvDyIe3IzuEp/
 NGtze/rV7IcW7J9Ol1iOS2BpJOi6ZTEIs0U1b7Y0YPcl592OvMpfGk3V9RjBbnqK2BaP
 0R3xNa7k5HuLoqofG1f63IC085TL0uS3gNjZPxDjsJaedm5IzmgoFpkFlde7ornO/Fzo
 Yd9BvtUqpVMsmt1vPmkUrO4ja/RZ9OOfpoH75rD3IMUpTHAkZmobhaNpxhVkHm7DhXvC
 +XXA==
X-Gm-Message-State: AOAM530p8UUkZV3T7edeDt2dtXbp2o+N3WFn7sSrQI4998GcE3vbDrZq
 9FjwlbBLM1BwrUG3gl/MhSssWo0t5DdpP7gVm9U=
X-Google-Smtp-Source: ABdhPJyHI1vhRcIh7T+QdG1gOkjboGssT04ZTA/RaYK/qvgRQZM+xTcwmU9xfnSyeFg9BxT8qV6/GQyEkB9L3EBcd9w=
X-Received: by 2002:a17:907:7094:: with SMTP id
 yj20mr6554020ejb.471.1598774500814; 
 Sun, 30 Aug 2020 01:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598598459.git.zong.li@sifive.com>
 <ee6a18d118b65cca0602e32bbb8be092f63ae8b6.1598598459.git.zong.li@sifive.com>
In-Reply-To: <ee6a18d118b65cca0602e32bbb8be092f63ae8b6.1598598459.git.zong.li@sifive.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Sun, 30 Aug 2020 11:01:22 +0300
Message-ID: <CAOJsxLHuX-nXFS6Dp+X=_hOrbT=-FUvWF_oM+6q508r=MNnFrQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: Add cache information in AUX vector
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_040143_730696_56AD69E5 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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
Cc: david.abdurachmanov@sifive.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 10:09 AM Zong Li <zong.li@sifive.com> wrote:
> +uintptr_t get_cache_geometry(u32 level, enum cache_type type)
> +{
> +       struct cacheinfo *this_leaf = get_cacheinfo(level, type);
> +       uintptr_t ret = (this_leaf->ways_of_associativity << 16 |
> +                        this_leaf->coherency_line_size);

You are dereferencing "this_leaf" without checking if it's NULL here.

> +
> +       return this_leaf ? ret : 0;
> +}

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
