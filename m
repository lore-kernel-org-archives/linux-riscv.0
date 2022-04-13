Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57A2C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivL17Z4EJv8H5RfcbZAdLkzj21NeOL8/hVB3MESsHNs=; b=Gtl8DWpsxCwX78
	Y01jzMxV+nP0aWL7ClgBjVnlHJ3ahUnKBtHAcyBOSAHxHqfTIz5Sam9hj1RxufNCq23hP4jd4PUNx
	HCBT+29pDB+3syZHBmzdMWy9U7BimJRO7rJ6Kxj+tt0j1AR24+8BsIiKQ1MkqUM5Ho4LDGlZxlnIj
	2hdmo4K0VhKaoN4TQbvXaxp4s8OYSMPqapFQypM/oSe4SCudcLScfua+sdrvd5dbmeYp506c0+ajC
	XRroTCvDjZ0hsPGsfGYo3a3N6b5m9/PHsd4WjCFfkgAqXeyG3crfPqae8FLfsL3PyhOPUs69BMEY7
	AICPXmmi5dZhUFXFeXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ09-000Er0-AH; Wed, 13 Apr 2022 09:09:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ06-000Enr-82
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:09:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id e21so1637677wrc.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2RfiU2yQ6Q5lZlNdTxAqM838LrNlHbSns2UR/xnZyg=;
 b=Bv9hcFImSBg1Wy9cSJnbpSHCywcPKdXI4iis2Lx7CwApVkjO4RXQVhuhKO8Vm5Yv2D
 0ziSbEulKjoblVYKI4v00wh69NZC4DAkXpL+oizYx61S3MRO6TmfUCfDpg/p4DbJB1Cz
 n3xK6ap0qp/GdBPdhznXce1Lkba/bQOSfLPQeS15qf0aYBgu6zz80qCoYI8St/DhjbM5
 hXZawCoOCGnMyoivcSIGTbHcrQsPAwbslEIZaQj2CTmm/UG2/gQtl2/aYFo8Oti43GVX
 HgkgDF9HtPhMRUvZHFnDSfonwNp4GXhEjUaSMwsEfrxBEnKMB5h3fvzRqnJ9Ks0K6Yrt
 0ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2RfiU2yQ6Q5lZlNdTxAqM838LrNlHbSns2UR/xnZyg=;
 b=jYINzp3VNs4Pq3AUBzphrNkHAa4I4oQgRcAu5bHyalXaodeBDQrdONlO+gOWem8phu
 g5qo1hLm3gHAoM8nQX/0iJpIeICnnyPOvQDfoTW3ZEqqJ9/dwukAFIAjjF8DF2DecWvk
 gRNl3zKjx7Mj2fYNB5OYdq4ZzSDtTAJOmVu29CCGP7h9hFQ2YPSRDziykqkya2QsOMHK
 xoKiaMiPX/ZoIzUggeX8hqwvoRMUYsJFOoTIEk5ZMz3TcQY6hb/V0OROJjeti33lbC1d
 /kZpD6r3lKDSYOxIvSFtRCzq44de4NdhR8pb+tYfGQWXGyl5A06S+M+RgntPJPpl6ysX
 MPrg==
X-Gm-Message-State: AOAM531t9ch7SLsfh48E//U16ByKQxO/FawLIan/hif+mrOfP90HDhfc
 /JmwQprNGmVqYDVo+51DzVUu+107zXdUAH6sJsEsOA==
X-Google-Smtp-Source: ABdhPJzJWfeDgw9z8zOfbk5VeVHE1qpmguwgSezKzsXwCVMGKLhcOhgFUMawAcm9xUFFN0C4OvgnSkf7iyasGSnP80M=
X-Received: by 2002:adf:de81:0:b0:207:a65c:d895 with SMTP id
 w1-20020adfde81000000b00207a65cd895mr11352594wrl.647.1649840959334; Wed, 13
 Apr 2022 02:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-7-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-7-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:09:07 +0200
Message-ID: <CAAeLtUCTpfnVM_e4vgYwpBDjbN24Vj-iZY8Nne6qLNTy9UeAEA@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] riscv: prevent compressed instructions in
 alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020922_414539_4564CC22 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Apr 2022 at 05:03, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Instructions are opportunistically compressed by the RISC-V assembler
> when possible, but in alternatives-blocks both the old and new content
> need to be the same size, so having the toolchain do somewhat random
> optimizations will cause strange side-effects like
> "attempt to move .org backwards" compile-time errors.
>
> Already a simple "and" used in alternatives assembly will cause these
> mismatched code sizes.
>
> So prevent compressed instructions to be generated in alternatives-
> code and use option-push and -pop to only limit this to the relevant
> code blocks
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
