Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137DBC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CboCIJk1RdpaVuGRAxh8kiwrTMlslQzTFiABTiNAKB4=; b=ktXm1kRazypzXS
	7CKVZBeofVLcBfrQEnXAMYdf8vz3QqqH4il1/hbO+9mnTFP+8MDDq80nROh3au6/BK40DNh5ulX/5
	YeeGJWIMv3BQi/bhy7qklxPwy03EQmIYo8L8IYubT5z8xGGMPArvbxal60DjDSnJNf+fARzdph1FB
	K7cwpM4F/fgqRopg1Ion85xQePyscY/gUi3aRvIC89rJhbeZQya0ISCwagVdF+AbHBLDjZFQvtLll
	T9LyjCkRI2GdAnpaZ1p/wdClx62OQ0BnSHssDB4+PmNs0rc9vg5tdZLLjzOnHRVopoO0n9GOhX57k
	jqV1ytsQo5ynmVIjGqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n141T-00EokA-99; Sat, 25 Dec 2021 10:11:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n141P-00EoiZ-Ul
 for linux-riscv@lists.infradead.org; Sat, 25 Dec 2021 10:11:29 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A0EA3FFD3
 for <linux-riscv@lists.infradead.org>; Sat, 25 Dec 2021 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1640427078;
 bh=I39oV/QZaWmlVgFT3DcbTijQiyG6xjSwFwSGQ0EVsOQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=EZQT3CtUQQ2gvjtwuwPnEYjZUl4pc0oL9rjmPqp4yF6mih0UOGbsk4FChjYQ97Iy8
 q4nRYtKlbEot5dC7VrKiGkTpY/BmD2xf4bF0AYrUV8Us5eaSvIpyf9um644hN4grVd
 CrUtw+Q7u4HppHy3KBPZ2MMdx9WqLvqqvY7qQHOLEDrDCviNqGKbE9cMRWBqvIeD2z
 xh5jyWaYfX+8QqmxXgy0xWAb6saP2na+4sVZyCFVaM/fdmyR7kMQ6MzGMlYxYy3eSf
 HwMSDJPadMyu/w31bb/v6gEIkteqond5l5j8jzLj4eTuOdJZOtMXKPLWsDXq8xxIYv
 WvS5uamwnQiAA==
Received: by mail-lj1-f197.google.com with SMTP id
 q19-20020a05651c055300b0021a259ae8bbso2867246ljp.4
 for <linux-riscv@lists.infradead.org>; Sat, 25 Dec 2021 02:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I39oV/QZaWmlVgFT3DcbTijQiyG6xjSwFwSGQ0EVsOQ=;
 b=p2OMZOTnFijXTxOzakQsXbE33U0SDUxGRs4Puq2ztRZAUpnbdyE5rqSUir/rp6RqGK
 grT2mVxGjwV2krxUswVxynAJ6TNDoBeA2jAguorghOnpqAnPYdJ9OlrtgrnCOPy3Q4iW
 WHUh13Wx/snfxjEEpfdTrURLCWHv+p3Ob/KNKSdlOvolYkNuvGqKicSoO5YMnfVf7XBL
 B7GiHkwCwttGGJTxjwkmOCWRkeWZu2Obn8sOCLprXzcKQDEE2qO0UCTVM91npLdmTDDN
 fOecjLcvWQd6ftJ67PGmzQkm7+xhnp80UgTwgHWoquu/zVu/6qiyUFjpWmClrNtRspAR
 ZvUg==
X-Gm-Message-State: AOAM533XtoVUdhRxfK2sF6pM2rc+eroksnwJTRi5eqTRZBNwG+riqj9j
 clIKWVdl9vZgofDwowvGryG6ppOdz+z0Nk+MxHI6R6+8bKJ+YqZZ6Nb2DgNQYT9CDXm1My6VAFz
 7rUAsGTmivkZnNDSNNBb+K8JTgDHCMag1BVxPUSBy6cjwbQ==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr7482612lfr.295.1640427077507; 
 Sat, 25 Dec 2021 02:11:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4sjq+1CG+HpXFM71RWmF3bJveHv7XWD7dzylenrpt+oIJERl9BtbYscnpD8bEiahaL/dhKw==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr7482598lfr.295.1640427077285; 
 Sat, 25 Dec 2021 02:11:17 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 f19sm183205lfv.100.2021.12.25.02.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 02:11:16 -0800 (PST)
Message-ID: <e20a52cf-69cf-747d-7cfb-0a2b58008ce4@canonical.com>
Date: Sat, 25 Dec 2021 11:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 1/2] RISC-V: Provide a framework for parsing
 multi-letter ISA extensions
Content-Language: en-US
To: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
References: <20211224211632.1698523-1-atishp@rivosinc.com>
 <20211224211632.1698523-2-atishp@rivosinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211224211632.1698523-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_021128_194061_A32CA873 
X-CRM114-Status: GOOD (  11.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 24/12/2021 22:16, Atish Patra wrote:
> Recently, there were 15 specifications/40 ISA extensions were ratified.
> Except hypervisor ('H') extension, all of them are multi-letter extensions.
> Going forward, there will be more number of multi-letter extensions as
> well. Parsing all of these extensions from ISA string is not scalable.
> Thus, this patch provides a DT based framework to for easy parsing and
> querying of any ISA extensions. It facilitates custom user visible strings
> for the ISA extensions via /proc/cpuinfo as well.
> 
> Currently, there are no platforms with heterogeneous Linux capable harts.
> That's why, this patch supports only a single DT node which can only work
> for systems with homogeneous harts. To support heterogeneous systems, this
> cpu node must be a subnode for each cpu.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Your from address does not match SoB. Please use consistent one - they
must match.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
