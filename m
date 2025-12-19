Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66658D74970
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqAuKIl0t8lAybbp6MRxxQd110ScRBDSrBydEmSjr2s=; b=hfrXrOAt1Alx0X
	M/wN4lEXNphH4CpXhowJrCE7WloVIo+IsGsnf7i9m8AUXpqOfJVtB6MYamwdz+bLgrWIScleV+z4H
	Y4sZPAre4V19so8X9O43RjE+ASUi4dO/rkFeSihlPz7iVjlMYel0ofFtMoJ6IunJBLK2SsiRNchXl
	vALHprOkiSNyZt9KXs3z/yXUwAqhqNTcUDj7CcwicR9E5UBAlIMSmgEHxUOGiUsXCOCK3EN9lInee
	2YTkjKZHjsTTK/1/QWiAUeoPb2+k3BWHA0/bjnJvs3qz/tJwe2H9Mjl4fJkQeEMlidKNbCEXpzFE5
	bvzBGffzQB44TPcUxmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBE-00000009z7o-3hPq;
	Fri, 19 Dec 2025 09:53:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBD-00000009z7Y-3mch
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Dec 2025 09:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jOuat8KKP+Tvr7fWRBLbtDgwdt3BN3ijZZqs7JNbva8=; b=jWuVfCt3GeTfmdvqiK+n659/1X
	X6FHo1iF79C/41BDD8tun44AQ9mH+p6Kwd/zfuy+SOTuGPwVA4JnM1Sj5qYl+1A7PW3eUUrNLFSbD
	Hog9nvhRuDPQ1SyozA6oiNkTkfb81yg05SNBF8UkrE+mjxqaWL2oJSwU1qKDVumZgPyClbT7QvDAn
	Htsa4Ihv2ccJHJLCWzNYq7jHCbq5sDnKSH7dplh0g6CjKAW9b20fFhjktDMB5+5F8a41+PLcemHUu
	5QEMQG0EbaHnHyv4MXDSV/TmLhQGvYKN5G9eAsUbwOrD2gsFTAfL1MGpZVJzwdzYhMoNxG7NLuY2n
	Mrovw30g==;
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWJh-0000000AWMN-2wTi
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:58:32 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1D6B03420CA;
	Fri, 19 Dec 2025 09:53:29 +0000 (UTC)
Date: Fri, 19 Dec 2025 17:53:19 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit
 common ccu driver
Message-ID: <20251219095319-GYA1955339@gentoo.org>
References: <20251219012819.440972-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_085830_404936_FFA3DBC3 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Inochi, 

On 09:28 Fri 19 Dec     , Inochi Amaoto wrote:
> Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
> SPACEMIT_K1_CCU. It does not guide the build for common clock codes
> even if it is a tristate entry. This makes this entry useless.
> 
> Change the Makefile to add a separate build for common clock logic,
> so the SPACEMIT_CCU entry takes effect, also add necessary
> MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
> build.
> 
> This patch mostly fix the build problem, and it should serve as a
> basic for the incoming K3 clock driver. See link.
> 
> Link: https://lore.kernel.org/all/20251217001833-GYE1903981@gentoo.org
> 
this series looks good to me, so

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
