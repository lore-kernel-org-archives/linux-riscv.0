Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65976C004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 22:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2E520663
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 22:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VeaTYpUP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BRZp7GNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2E520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OPBlKaeA8rzU6fPYCAEAyaIxRSpTFDgTMnmcCiUZmCg=; b=VeaTYpUP66hP35ElqQ62SYWi1
	RFq86KF6xq/GLVeI7w1/CQpypCpNCp3opcOaDhpzkAvhaC8b78rB5jojkLoMnLToUFLng0BS3SWDq
	tVYbpPK4GQZx5WVL2XxvcrZjc11Sy3dBF+O77IuIij0rSv8ATSGRsL1w7NQo3uf4AVQTG5kROZJLq
	wfjZid6H7LGKr/BgE57ZGXQGejS0aks59w/BsLZW97L0WwSdxk4kuhKcOjwbiIX/MfYgnhnGSHmJ3
	8+rjvuv5GsPLKpN7hTb5i319FPwTFQTgSPWMtCJh4sVgFYbI0LaW+Y1tlF7CfEvcuWYETqUtC+QIT
	kshecLOIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEj6r-0003dx-0J; Mon, 22 Oct 2018 22:55:41 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEj6o-0003dM-9x
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 22:55:39 +0000
Received: by mail-pf1-x441.google.com with SMTP id g21-v6so13637939pfi.7
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=r7yZLn68sbOk7hs4CYqLx+hlOfURlzn+vBrcgdejPPM=;
 b=BRZp7GNq9Je8VCEaI+LLNRS9W8sONE95eEq1SabOCzN8yS7zATnhfVEL3MidQ8qa/1
 wXH9ctlhV325nww+A5gulHmF+ZSujfGIaVu1PCsOeX7gLh3kIgf2JUl/bUBfBvYw1V01
 /QjbJOlC1ntJn/AZLfTNFK3ohA6S1dCE9U6VAtbJNV8TYjAmNr4bRgnAFhUZh4YKXbMf
 a9fQE5j3oO1sa9O0gTIxce9loXbhL3KOz4iv4YR51lsVQqJQSrKvCE5gkCz+ZAXeJVx1
 Bv+xe/9rgZsqn6ApsK9dk2IGCH1FtEqSK86RwbTrVSh8ToDA7qAFG3jv5wkJIHUqfLdK
 tZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=r7yZLn68sbOk7hs4CYqLx+hlOfURlzn+vBrcgdejPPM=;
 b=oQAr9BhT20MyZ91wXOWOUCpPmfTRft8QrpXe3b8NKpKyn1aPjbjN+CGaBV8TYdiDYP
 t0EDV+fWlgT5YUln8Xa5mfjXnPnkL52IBj5i1QJxHBcFhd4wCRYjynyTQtBnFC4lz2jg
 qSVw0RjUpxFezgaLclv4H/gEbzwGk9nEX+yz0nLm0zlVr/SHGo1uwBdCrosMMu6GmmWn
 HWBtYszoGN+2zVDpQCorXTsJ1faZtQkg2eVAWXM1JKQMu/m6loL7zuxmLLRkVEl89sBD
 hHr+AJa0sHjWu+OwaG/+osa6WZ0Sn/APEVWXXDDVsBrEeWimOUb0aNnM8Bn2hYUVTSiI
 vnVg==
X-Gm-Message-State: ABuFfoj5rWhhPlE3sO2lmVWx5rG+Ljbd5oNdVspyymYVEvDnMwAbJC/a
 R/EfGtcsKmxuj0FeM1089oTavQ==
X-Google-Smtp-Source: ACcGV62PJPL2/X41/eubx7QEKi4M5IAsvkC1vY13646Bwl56nJ/imu7HXKrlZs7oCIAi84TX7Ijbvw==
X-Received: by 2002:aa7:88c2:: with SMTP id
 p2-v6mr39811945pfo.32.1540248927208; 
 Mon, 22 Oct 2018 15:55:27 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s80-v6sm43083294pfa.114.2018.10.22.15.55.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 15:55:26 -0700 (PDT)
Date: Mon, 22 Oct 2018 15:55:26 -0700 (PDT)
X-Google-Original-Date: Mon, 22 Oct 2018 15:48:42 PDT (-0700)
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
In-Reply-To: <20181022224213.GA25145@bogus>
From: Palmer Dabbelt <palmer@sifive.com>
To: robh@kernel.org, linux-mips@linux-mips.org
Message-ID: <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_155538_379346_3BCE0500 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: mick@ics.forth.gr, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, frowand.list@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181022225526.FS8LqQ8Sk_ixJtL8xSC7shehxNbQx7fu9S8K3o_zVEM@z>

On Mon, 22 Oct 2018 15:42:13 PDT (-0700), robh@kernel.org wrote:
> On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
>> The /chosen node is optional so we should handle CMDLINE regardless
>> the presence of /chosen/bootargs. Move handling of CMDLINE in
>> early_init_dt_scan() instead.
>
> I looked at this a while back. I'm not sure this behavior can be changed
> without breaking some MIPS platforms that could be relying on the
> current behavior. But trying to make sense of the MIPS code is a
> challenge and they have some other issues in this area.
>
> Can't this be fixed by making /chosen manditory? I'd expect ultimately
> you are always going to need it.
>
> I'd rather not resort to making this per arch. There's also some effort
> to consolidate cmd line handling[1].

I'd rather make /chosen mandatory on RISC-V than to have per-arch handling, as 
like you've said there's already too much duplication.  That said, it does seem 
like a bug to me because the behavior seems somewhat arbitrary -- an empty 
/chosen node causing the built-in command-line argument handling to go off the 
rails just smells so buggy.

If that's the case, could we at least have something like 
"CONFIG_OF_CHOSEN_IS_MANDATORY" that provides a warning when there is no 
/chosen node and is set on architecture where the spec mandates /chosen?

I've added linux-mips to see if anyone has any ideas.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
