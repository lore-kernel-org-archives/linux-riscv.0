Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA7ECA5501
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh2x3LmCKGUIN3hzqMw+YkuOtGM9oNZTKpFs4ialpfQ=; b=h3Pwd3Y8uvhfX6
	aLvidtYUhxb8FO/tzeDChuqM4VSqxX5x+mj1TOXNDMW+V5zxbpF/7q8rk7LxvDZvIB6OZmiXrCTP3
	6J2W1u/0498vvdsNZrmpBe9DphUSyn9kZ9aBiP34wUxoJpwqlk/ntQuE6RvLNga0TkhT8BiV+a0mN
	9or99vcw6lmI/opMNEqaeeWA25dsHmSYsy9X7m0zCzo87veoTUFFex+XQrMdyujC0dE+yHrnwiHZx
	Mw4thXP8TrWZiv+vfwo/08bYB0XvJtibyXVdPp6FU7ERN2vkzXanY/0ZiWfP2yE8IKw+/lzjCOz4b
	+4PmSlh/1TZxhRjOmK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKAA-004vUu-2b;
	Wed, 13 Sep 2023 07:19:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKA7-004vSg-2C
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 07:19:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B99E0CE1F1B;
	Wed, 13 Sep 2023 07:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76744C433C8;
	Wed, 13 Sep 2023 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694589582;
	bh=cy7DEz0lIpFLZxqiOUHfTDXkS62t4WAJEpcmc0YPNTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMTeWbohEcMDyajrofKRM3dmu12suPlQ8xokQ3LBND+8wL34fdjrPllM/UE9LKZUv
	 QfLqFSCUl3VbiYMQdryoZkVDSFlZCIvQOFhPM1N6IJz47LVo9Tg4Hy2FcnZ2VsedjT
	 isDgBk3chx3Mo0pjBbQm9uSCYTzJfGJVh4wdDvzo=
Date: Wed, 13 Sep 2023 09:19:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself
 for RISC-V
Message-ID: <2023091307-narrow-glider-05fa@gregkh>
References: <20230912180657.31841-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912180657.31841-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_001947_935290_AEC4CA0A 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 12, 2023 at 11:06:56AM -0700, Palmer Dabbelt wrote:
> I'm not sure exactly how RISC-V fits into the story here, but I'm happy
> to voluteer a sort of catch-all for vendors who aren't otherwise
> represented.
> =

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/process/embargoed-hardware-issues.rst | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Docume=
ntation/process/embargoed-hardware-issues.rst
> index cb686238f21d..ac7c52f130c9 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -251,6 +251,7 @@ an involved disclosed party. The current ambassadors =
list:
>    IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
>    Intel		Tony Luck <tony.luck@intel.com>
>    Qualcomm	Trilok Soni <tsoni@codeaurora.org>
> +  RISC-V	Palmer Dabbelt <palmer@dabbelt.com>
>    Samsung	Javier Gonz=E1lez <javier.gonz@samsung.com>
>  =

>    Microsoft	James Morris <jamorris@linux.microsoft.com>

Thanks for agreeing to do this, hopefully you'll never have to ever get
notified of anything :)

I'll queue this up in my tree now,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
