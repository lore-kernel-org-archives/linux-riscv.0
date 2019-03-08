Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2CDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F99A2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MccHPrMU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F99A2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW55Mdo15rpX70mrgfeM5ybRxr8B1MAVTXG3GEmJ6X8=; b=MccHPrMUV1dyke
	47WY52cuSJY3clxRA+SmRZM6CysFOMakqeDZdXRwSFPcs9yVWMuzmZEOzriZwRY60wvnmY3K6Im61
	fJ8K3IZ+hCTvh15Hh0qA+5df52xt5wSkGl/+4rlCdXAgL0dprdpzPufSMzTo+GJLJu21KN1EID2+i
	z4Ra88L/zm1aCNZNqkTza6jzar1IATRL8eMuWStgcFrgoTVnuRFKUDkDG8u4COSxvLbFvFH7c1pAV
	9MQ8Fk2Y+V9dYDZZBPKcvTdc2lzAYQ9oUBVHuMxkuF+HSTPR5SSrpFvvX0tmYTRxuwyiAKhBHyiWt
	IJf7EUaOAnJ+5H1D8sqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2GGA-00078k-6X; Fri, 08 Mar 2019 14:14:02 +0000
Received: from smtprelay0082.hostedemail.com ([216.40.44.82]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2GG7-00078C-I1
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 14:14:01 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 1BD2818224BBA;
 Fri,  8 Mar 2019 14:13:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: box53_3f21f3cb28324
X-Filterd-Recvd-Size: 1935
Received: from XPS-9350.home (unknown [47.151.153.53])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Fri,  8 Mar 2019 14:13:53 +0000 (UTC)
Message-ID: <10c498eede0b780af7bbea9ae4f9848e74d9da55.camel@perches.com>
Subject: Re: [PATCH v1 4/5] scripts: checkpatch.pl: don't complain that
 debian/rules is executable
From: Joe Perches <joe@perches.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, 
 linux-kernel@vger.kernel.org
Date: Fri, 08 Mar 2019 06:13:52 -0800
In-Reply-To: <1552049064-32044-5-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
 <1552049064-32044-5-git-send-email-info@metux.net>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_061359_656944_CF1C42E8 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: apw@canonical.com, yamada.masahiro@socionext.com,
 linux-riscv@lists.infradead.org, michal.lkml@markovi.net,
 linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2019-03-08 at 13:44 +0100, Enrico Weigelt, metux IT consult wrote:
> checkpatch.pl complains when adding executable "debian/rules",
> obviously a false alarm. Therefore add an exception for that.

This is predicated on a debian/ directory actually being added
to the generic kernel tree.

I'm not sure that's a good idea.

As debian/ does not currently exist in the generic kernel source,
I think this can be kept locally in their tree if they choose.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2576,6 +2576,7 @@ sub process {
>  		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
>  			my $permhere = $here . "FILE: $realfile\n";
>  			if ($realfile !~ m@scripts/@ &&
> +			    $realfile !~ "debian/rules" &&
>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {
>  				ERROR("EXECUTE_PERMISSIONS",
>  				      "do not set execute permissions for source files\n" . $permhere);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
