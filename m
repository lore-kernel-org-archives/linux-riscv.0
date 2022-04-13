Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE3AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UVQGgtgkoCwPxjcjuObrIIFd19giVmDqVSNJ0ALH8w=; b=SbJ2INSutrwWQ6
	0c53+Hfn1dTDtbAfbPwgyIZhlGHgJoAhg3HjllI0/QNCmbjlc1wk1SzF7/y4ZsIZBPH0zyvXEsyZO
	I19HAioZNh/Bb2pbKeKhglxIlUSy3kTWg2+4YZB4d2vE7lP12SQ5AMyHp7JufXNeA0vHxdazftUpN
	je410aAT4GUVY79cSCYSZJSKhHHd0VEymat6D4Dl1PuB25OJKI28SBFJdlm78/73hDu1WX4kaKnY5
	PL2n8hTp+pkOciO7FjFhCVqZoaF8YvUET/kFlj3du3SfhF5LFriypNDjaMhPdbdkqmjWDSieYPE5+
	1bItquNKm1T21lyisdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ0V-000F0n-A6; Wed, 13 Apr 2022 09:09:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ0S-000Eyz-IP
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:09:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so752839wmn.1
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwwGHu/kUMtzWbNVENzqf/cbed0N54Cas9skXOt024o=;
 b=XPnqVjG6h0UqhmNIPxikuceAuDekilIJ8T7vPpT4es4yah+70QMaFq1ZJgjKjC0ysb
 /OOCXveVq7AxK8PP3+X9/cJWZSEhjvknXaHwbtZWvECzXTwhiz8RvRR9n9gJ8JKJq0ij
 Ec4lCA0rRcVHxI2+LlU9084ORpwvoSfBzhz+dC/h5+ytDlWeihmcpiEA8WjcO63Uc7LX
 MQULtqO6+f51msdsVyPA9QpbR8k+PVyG5EPW48DOs6jbZTNSM060mNbJNLi8pJ9f4z5q
 8KuSwphoN8QK5WZFEYW3bK62hb9rf7Mdg/7gJPj6I5/4xN7hrNKKNgl7C5cyUuj4hTPS
 B3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwwGHu/kUMtzWbNVENzqf/cbed0N54Cas9skXOt024o=;
 b=Pb/GABeXqPlplU02DDNHvvvaad3LgZCkiXrm3N+1o3EeVdU+j93S5kCdCor5ecxrxQ
 uqOllg9WJiJcE5DBp2VIsXl/dhgNee/OqXoNgrHt7u6m/Qgf3eWP9PClgl3nEjQRqGHU
 NNdI0pfzpB2wJUW07dVe6EBZ3tcOaB2BWDiMpGAok/WE159SrKbdr19MoNVWuKZZvva5
 HtY1s79MnWrsNFMuJ5p3xI74lYGhkzsrL22Lr26rqMmSWLYhiRqHLxgz57zLAan4QzQx
 gkgidGpMcy0pUI6nj9Xe3QJU+kbxkrtxNiczdpaLalYkgQSKADpDJsVpUwa3Ji+fEwC1
 ZZ8w==
X-Gm-Message-State: AOAM530Y8mZ62JmmSLj9ikYUbzH0cYVwVlWykmK1V5NZYnbGJcUdsVew
 4r9OQFZVFp0t2kueJlv6JmTR0yWoy/wYv1tbnTpGBw==
X-Google-Smtp-Source: ABdhPJxxa6HPTIn07pYdJ/EeVtDrpC/qaoIRKLB3HdORWATBXFu5XeDq8MFROb7IVg/gNg3daadJJezwX0cOlwNnhsM=
X-Received: by 2002:a05:600c:35d4:b0:38f:6799:a386 with SMTP id
 r20-20020a05600c35d400b0038f6799a386mr664904wmq.196.1649840982912; Wed, 13
 Apr 2022 02:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-9-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-9-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:09:31 +0200
Message-ID: <CAAeLtUDdRTuehHFi576tpzEo0QV9=qQtU8BOarAb4OF-Bizdow@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] riscv: Fix accessing pfn bits in PTEs for
 non-32bit variants
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
X-CRM114-CacheID: sfid-20220413_020944_672450_560BA7CF 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On Wed, 13 Apr 2022 at 05:04, Heiko Stuebner <heiko@sntech.de> wrote:
>
> On rv32 the PFN part of PTEs is defined to use bits [xlen-1:10]
> while on rv64 it is defined to use bits [53:10], leaving [63:54]
> as reserved.
>
> With upcoming optional extensions like svpbmt these previously
> reserved bits will get used so simply right-shifting the PTE
> to get the PFN won't be enough.
>
> So introduce a _PAGE_PFN_MASK constant to mask the correct bits
> for both rv32 and rv64 before shifting.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
