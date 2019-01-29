Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281B7C282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 02:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03D0214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 02:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrBziU3d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VUUg0A8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E03D0214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=TUyXz9BgXQnAAydRsdYnxPS10g7o9+eEwltybMIekMo=; b=OrBziU3d/NcKhIWh5xLIaLkc6
	V7VVc325KM7CpE/9gxAblMyrDR+AQ5R0LunKl//Om3vyKqjvs+A3Kim9mGrEpGr6MLoLxBG+VZjWV
	eEGXLQiAScto8gV4r69syAOfHz0hWkx1h8VQ2IcD+JztL11PF44PNb6DfT0w+ffp2Vkp5YYpK1zvM
	RP7Ajv9LU6NbGjAD8cIePVn0NxHjMFM4AUXafUMKgq1Ry+sQI5v+K4B5WgOeaCpN7vej0/uXeL6Xn
	RA+cz8VCJaKrWZniqTBtIba4q9zIUq492qwpZMN9Kmy7Z6oFOLEg+N19+xcX/vOKTUk+c0szNm/UC
	a7FiH83EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goJMz-0005XX-Er; Tue, 29 Jan 2019 02:43:25 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goJMv-0005WH-7g
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 02:43:22 +0000
Received: by mail-pl1-x643.google.com with SMTP id g9so8670739plo.3
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 18:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uGhtJew8V8IVHDP2ojAqAmVpvsOfI7pNzmTu2ZaYKlM=;
 b=VUUg0A8NR6sreK3e89AzR3MRjZmDYVrBSC3Ev/yv7XblYqn1mrnHgTgGbWMnPAedDe
 aNaM+buru/mn59VBgtQ/K1Mx8KqBGHiFQcB4qw/vsiimI1hvwR28+z8oq5kDSlosXV9S
 fd5wMUXtMnOWlocr8Sb8/ara9hKp2u0O5h7XRmvurY7n7shL+1ttzW8qRwf4tpxM5HOD
 jxJiFAfC4kMSTSKgc+NBLYKAfvt73UO2DVJ1Nw4jdi61jZIRgda5aODo99tsHG8qPT58
 6uf2H8p+V3A7+NZK8b0gDVNmVgeilFTpy/0Z5Ao6P2zXnkKsJSXvkezfRaLR8kPE5+1r
 ApoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uGhtJew8V8IVHDP2ojAqAmVpvsOfI7pNzmTu2ZaYKlM=;
 b=lceN7CYs+1ZAszqHUMucUqd+zNec8d8KiJCJIR5cvtxIlDdngzTCf24N++EiuJ41rj
 UieyQFX8IVMDZj0Bs/fAgFbV4NWj9EF9D+9jaAkAbBFBflf/pmTSNvEQk8DCWVYZYJ7P
 LyEc78DriMj4teYhXZWk1Rl2KuhWYKIWnqDKPblmrtohwCfWHbP6trD5QFftp7PTkqaJ
 cGwdIv7vIJDGXSSBedA7mmrhYordnl1nt7sqKlBZXZyOBU9ucKVu505B1o1FAeHNz1AZ
 3Zlq8x2G+8gGgT6SS1fQqmxVzeS+xDdppJnVPz+TJDcEYzAzAXZ+H1OwHqDVPC8ChZfn
 Kk3Q==
X-Gm-Message-State: AJcUukdxT6vv2/HPwaOhPJSsobY4CWpj8pZkFY8fYSB6R/YZQXUiR0Fj
 CR4nVhQGWxK12zkGpMJheh8bnw==
X-Google-Smtp-Source: ALg8bN6vEkg3CDRHzD9i8Iv2CCJoXpReVKMTqvCc6dGPdTqxknCrfOex4np4naBDvGxLtZRmNLf5EQ==
X-Received: by 2002:a17:902:42e4:: with SMTP id
 h91mr24693197pld.18.1548729795749; 
 Mon, 28 Jan 2019 18:43:15 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x127sm54610610pfd.156.2019.01.28.18.43.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Jan 2019 18:43:14 -0800 (PST)
Date: Mon, 28 Jan 2019 18:43:14 -0800 (PST)
X-Google-Original-Date: Mon, 28 Jan 2019 18:43:08 PST (-0800)
Subject: Re: [RFC PATCH 1/3] riscv: set HAVE_EFFICIENT_UNALIGNED_ACCESS
In-Reply-To: <CAFyWVaaAg9TuNVPbNmP0ongf6y2hmqFMiXJZHo8K84O4-BV0yw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Jim Wilson <jimw@sifive.com>
Message-ID: <mhng-13e1a533-81f1-47cc-8d1e-a4e5332600f4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_184321_307138_60B0B457 
X-CRM114-Status: GOOD (  12.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: davidlee@sifive.com, daniel@iogearbox.net, bjorn.topel@gmail.com,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 25 Jan 2019 17:33:50 PST (-0800), Jim Wilson wrote:
> On Fri, Jan 25, 2019 at 12:21 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>> Jim, would you be opposed to something like this?
>
> This looks OK to me.

OK, thanks.  I'll send some patches around :)

>
>>     +    builtin_define_with_int_value ("__riscv_tune_misaligned_load_cost",
>>     +                                   riscv_tune_info->slow_unaligned_access ? 1024 : 1);
>>     +    builtin_define_with_int_value ("__riscv_tune_misaligned_store_cost",
>>     +                                   riscv_tune_info->slow_unaligned_access ? 1024 : 1);
>
> It would be nice to have a better way to compute these values, maybe
> an extra field in the tune structure, but we can always worry about
> that later when we need it.

I agree.  I just went and designed the external interface first and hid the 
ugliness here.  The internal interfaces are easier to change :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
