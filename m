Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1D8C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PD03XTeFqw8+9rFLNzbCRBiZMQrutg6CjFbhYuNaiOE=; b=c9EIiVd0hpsw96
	zdo05R+K8J2vMVb/5/zMVc0GM3wvOrlDy9Ww29B5XozaQ5xzzjWAfxdUGdh2JYD4cSDg5KMiHjA6K
	rnDZA5SS1xQwpMXOmYxN5Ir8UR2txpFN3I5jx1o2jOt8MB95ZlsB7CJF4vlfmL8fB3V4fwKV/pCfK
	mAKXkwBnE95CuTWpMXw8nkuSIie1ITgYmjnUFk3i9v1kdRtDIcTIOOvUtqdmcjSnAckQZARW0mPyc
	EhaXRv1SXw3ai9d2t5SiswBaj3yWDD5dN+pDi53F/fNKoeYvlnTCJJ+9FILWhHl2MAoItr33ObZWF
	nyGKZErm+ieHMgAmR+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OcH-00000002MQ7-3uYO;
	Mon, 29 Apr 2024 10:52:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OcE-00000002MO3-2Piy
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 10:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 747E860B98;
	Mon, 29 Apr 2024 10:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B786FC113CD;
	Mon, 29 Apr 2024 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714387929;
	bh=TplSGSvyRT6W63ok8ViJuEHmTniOYHRptY4QwWjj9OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0LMHKa8LlxQAVkaE0WvaBYVXdkWOfPuTdDSjbFTBVrTgXi6rKW0Atpsq+87AoMfpQ
	 N+Wedbu77bd3H8P3KOG5WD0EroKyAJNVEhAo/zckCPSP5zW0L5vQAUhXX4M6qdZJEe
	 wezow37NnGWwUdTeVk0b0GxHPLQLVRBvzO1psrww=
Date: Mon, 29 Apr 2024 12:52:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: stable@vger.kernel.org, Chen Jiahao <chenjiahao16@huawei.com>,
	Baoquan He <bhe@redhat.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Revert "riscv: kdump: fix crashkernel reserving problem
 on RISC-V"
Message-ID: <2024042944-wriggle-countable-627c@gregkh>
References: <20240416085647.14376-1-xingmingzheng@iscas.ac.cn>
 <2024041927-remedial-choking-c548@gregkh>
 <3d6784be-f6ba-48eb-ae0e-b8a20fe90f58@iscas.ac.cn>
 <2024041939-isotope-client-3d75@gregkh>
 <a5493f44-2aac-4005-992b-f2ac90cd1835@iscas.ac.cn>
 <2024042318-muppet-snippet-617c@gregkh>
 <5d49f626-a66f-4969-a03f-fcf83e2d2bab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d49f626-a66f-4969-a03f-fcf83e2d2bab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_035210_741085_855F712F 
X-CRM114-Status: GOOD (  33.79  )
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

On Wed, Apr 24, 2024 at 11:40:16AM +0800, Mingzheng Xing wrote:
> On 4/23/24 21:12, Greg Kroah-Hartman wrote:
> > On Fri, Apr 19, 2024 at 10:55:44PM +0800, Mingzheng Xing wrote:
> >> On 4/19/24 21:58, Greg Kroah-Hartman wrote:
> >>> On Fri, Apr 19, 2024 at 08:26:07PM +0800, Mingzheng Xing wrote:
> >>>> On 4/19/24 18:44, Greg Kroah-Hartman wrote:
> >>>>> On Tue, Apr 16, 2024 at 04:56:47PM +0800, Mingzheng Xing wrote:
> >>>>>> This reverts commit 1d6cd2146c2b58bc91266db1d5d6a5f9632e14c0 which has been
> >>>>>> merged into the mainline commit 39365395046f ("riscv: kdump: use generic
> >>>>>> interface to simplify crashkernel reservation"), but the latter's series of
> >>>>>> patches are not included in the 6.6 branch.
> >>>>>>
> >>>>>> This will result in the loss of Crash kernel data in /proc/iomem, and kdump
> >>>>>> loading the kernel will also cause an error:
> >>>>>>
> >>>>>> ```
> >>>>>> Memory for crashkernel is not reserved
> >>>>>> Please reserve memory by passing"crashkernel=Y@X" parameter to kernel
> >>>>>> Then try to loading kdump kernel
> >>>>>> ```
> >>>>>>
> >>>>>> After revert this patch, verify that it works properly on QEMU riscv.
> >>>>>>
> >>>>>> Link: https://lore.kernel.org/linux-riscv/ZSiQRDGLZk7lpakE@MiWiFi-R3L-srv
> >>>>>> Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
> >>>>>> ---
> >>>>>
> >>>>> I do not understand, what branch is this for?  Why have you not cc:ed
> >>>>> any of the original developers here?  Why does Linus's tree not have the
> >>>>> same problem?  And the first sentence above does not make much sense as
> >>>>> a 6.6 change is merged into 6.7?
> >>>>
> >>>> Sorry, I'll try to explain it more clearly.
> >>>>
> >>>> This commit 1d6cd2146c2b ("riscv: kdump: fix crashkernel reserving problem
> >>>> on RISC-V") should not have existed because this patch has been merged into
> >>>> another larger patch [1]. Here is that complete series:
> >>>
> >>> What "larger patch"?  It is in Linus's tree, so it's not part of
> >>> something different, right?  I'm confused.
> >>>
> >>
> >> Hi, Greg
> >>
> >> The email Cc:ed to author Chen Jiahao was bounced by the system, so maybe
> >> we can wait for Baoquan He to confirm.
> >>
> >> This is indeed a bit confusing. The Fixes: tag in 1d6cd2146c2b58 is a false
> >> reference. If I understand correctly, this is similar to the following
> >> scenario:
> >>
> >> A Fixes B, B doesn't go into linus mainline. C contains A, C goes into linus
> >> mainline 6.7, and C has more reconstruction code. but A goes into 6.6, so
> >> it doesn't make sense for A to be in the mainline, and there's no C in 6.6
> >> but there's an A, thus resulting in an incomplete code that creates an error.
> >>
> >> The link I quoted [1] shows that Baoquan had expressed an opinion on this
> >> at the time.
> >>
> >> Link: https://lore.kernel.org/linux-riscv/ZSiQRDGLZk7lpakE@MiWiFi-R3L-srv [1]
> > 
> > I'm sorry, but I still do not understand what I need to do here for a
> > stable branch.  Do I need to apply something?  Revert something?
> > Something else?
> 
> Hi, Greg
> 
> I saw Baoquan's reply in thread[1], thanks Baoquan for confirming.
> 
> So I think the right thing to do would be just to REVERT the commit
> 1d6cd2146c2b ("riscv: kdump: fix crashkernel reserving problem on RISC-V")
> in the 6.6.y branch, which is exactly the patch I submitted. If I need to
> make changes to my commit message, feel free to let me know and I'll post
> the second version.
> 
> Link: https://lore.kernel.org/stable/ZihbAYMOI4ylazpt@MiWiFi-R3L-srv [1]

Can someone just send me a patch series showing EXACTLY what needs to be
done here, as I am _still_ confused.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
