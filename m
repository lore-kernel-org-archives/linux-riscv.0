Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE16F9D0FD
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ng1NyydmMGtbQG9gfqDz0Sq2CV/cnaNIouBsyepKdq8=; b=p0TiswLp5oF6/yZZsM0gUFMSzW
	wasFEXR4TPZ48VsiOgXv39Ykpe9vbDUsKzlOIqavcpAAKSyNea3GiGUE/NI9mTGnoeadSGSGoz8mt
	6mx3a/YEBNVmQWi5Z2a/ftyWbZ2tLbnJ7w2HzXmHhXPOAlmiQrF5jzpU5+TC2O7+F7XIjvOAgip6w
	GyT2FfiVjJRht+Hck1KRbCwTSQSp6RKdJ0bluOsVVepVPPCDS/dtLDa15aelEyOLqQL5wQrILRfLy
	itMYdEkGLsuvHE1zpIW6clWu3Hmwka0OWWT2cXRdE/ms25LbnuuH8UNDyx+InMDT8HH/aPv/ohoTg
	PFnkR8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCobj-00000000PFv-3I5E;
	Wed, 15 Apr 2026 00:59:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCobh-00000000PFZ-3ONn
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 00:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFFD344503;
	Wed, 15 Apr 2026 00:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAE0C2BCB3;
	Wed, 15 Apr 2026 00:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776214792;
	bh=wpJVPa82t/Q9ZbyuHOA8+fPbPFbqOgSSPuMHwapeSJs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Mwf/O9j3O9U12LdMOChSyxTrjaXNqkQcxgAmMZu9Wf4JtA6YU4ukf+6V6hBNziHLs
	 aLwYszWnDflF0kfKx+uZOsZPmedvQnyQzL/FDgOi5AhlzT9jbqzE5XvHokRIkTGA1/
	 lLTw4oUU0WOqW7ekRckoogE+puWQlU37NpUjyF1pug0UdMQRl5FvjLQ97bkdepzoeb
	 9dTLk3SlMTT26KDtLnokT/GULOsE5b1KGpB9/sKzhQvmB97yv31kSFrbuXIOXoIQoz
	 6M7boRHMqaTmVufbuwSo/gmD5HWBJZBBN0rmjdVT4wXPu1yoQL9Se/FnwVHvtOAvOP
	 9DTheOng+3lAA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 84DBEF40069;
	Tue, 14 Apr 2026 20:59:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 14 Apr 2026 20:59:51 -0400
X-ME-Sender: <xms:B-PeaYrbpcE5KUu5OIkvJvN7sFX198RJ-5IO3R1dTF7WCMPW_DYnCg>
    <xme:B-PeaZCKSQ0xgkJa5b8vpyQEt3ZLBjcsoXD7Gvyiu7xEEYZ6GsN_X4IGTMaK7t30C
    vOXhAls3eshYc-lZxQZtztYbdGy8nmGfwxs2CKg8zbVI5VG1Y6TpGU>
X-ME-Received: <xmr:B-PeaTX_UwQWHB2uM_CK6bJGSyX79QbB-lHoRbRBGHQ28WWT49Rl0gH71W6onfWQpdrXht8h4oKt_uV7cGF6BYImPOmS_ovOZ2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elhfeiudfgvdeijedtleeltdduueekffejjedvjefhgeevjeefueejledtleetjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegujhgsfidomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudejjedvfedtgeehhedqfeeffeel
    gedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpd
    hnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgt
    hhgvhhgrsgdohhhurgifvghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsg
    gvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgv
    hidrvgguuhdprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtohepug
    hjsgifsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:B-PeabBrUKV6GjdD8Vo9eGHmglR3pA3OQQgnZOj2Rgm930tPnOt-kw>
    <xmx:B-PeaQf_aB5ZSobl2hStB2MEXVFMNS4SeTnNbALkD9JLHENupk4U2A>
    <xmx:B-PeaSpT86eZ403iIWqB5TS-jmj-tyFTwqJlfdxD2khZNRT6UHEJrQ>
    <xmx:B-PeaRSV7ZbREip4BBPCejIAOSB0zrbSMEN19rhbG_U51HVgljX4oQ>
    <xmx:B-PeaSVBGtS0fTmGc39EUjuKD4qu0lm9b_AfraOVjOBVuLDrlRxSlLXS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:59:50 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:59:50 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Dan Williams <djbw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <69dee30660eb_147c80100a3@djbw-dev.notmuch>
In-Reply-To: <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 4/4] docs: auto-generate maintainer entry profile
 links
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_175953_896924_FFC16B2D 
X-CRM114-Status: GOOD (  14.13  )
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

Mauro Carvalho Chehab wrote:
> Instead of manually creating a TOC tree for them, use the new
> tag to auto-generate its TOC.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../maintainer/maintainer-entry-profile.rst     | 17 ++---------------
>  Documentation/process/maintainer-handbooks.rst  | 10 +---------
>  2 files changed, 3 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index 6020d188e13d..48ecabd4ce13 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -98,18 +98,5 @@ Existing profiles
>  For now, existing maintainer profiles are listed here; we will likely want
>  to do something different in the near future.

Given the "near future" is now, I would say go ahead and delete this.

> -.. toctree::
> -   :maxdepth: 1
> -
> -   ../doc-guide/maintainer-profile
> -   ../nvdimm/maintainer-entry-profile
> -   ../arch/riscv/patch-acceptance
> -   ../process/maintainer-soc
> -   ../process/maintainer-soc-clean-dts
> -   ../driver-api/media/maintainer-entry-profile
> -   ../process/maintainer-netdev
> -   ../driver-api/vfio-pci-device-specific-driver-acceptance
> -   ../nvme/feature-and-quirk-policy
> -   ../filesystems/nfs/nfsd-maintainer-entry-profile
> -   ../filesystems/xfs/xfs-maintainer-entry-profile
> -   ../mm/damon/maintainer-profile
> +See Documentation/process/maintainer-handbooks.rst for subsystem-specific
> +profiles.
> diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
> index 3d72ad25fc6a..d3d74c719018 100644
> --- a/Documentation/process/maintainer-handbooks.rst
> +++ b/Documentation/process/maintainer-handbooks.rst
> @@ -9,12 +9,4 @@ which is supplementary to the general development process handbook

Given this whole thing started with a question about why there are 2
files you can go ahead and fold in:

---
For developers, see below for all the known subsystem specific guides.
If the subsystem you are contributing to does not have a guide listed
here, it is fair to seek clarification of questions raised in
Documentation/maintainer/maintainer-entry-profile.rst.

For maintainers, consider documenting additional requirements and
expectations if submissions routinely overlook specific submission
criteria. See Documentation/maintainer/maintainer-entry-profile.rst and
the P: tag in MAINTAINERS.
---

...suggestion with a:

Co-developed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Dan Williams <djbw@kernel.org>

...if you want me to submit that separately, just holler.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
