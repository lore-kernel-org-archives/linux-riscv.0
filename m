Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFAC77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rQP3pDG7OzjALrbqO/TKaWkhU6xBpxc2QDSIX6ZB/M=; b=ZPYOxqrS3iZDYX
	0J3/BKqq1YJ+QVRnfRWBzg8y9Fhah55FVS4PahFcBOXK3vXa8wP+Xw9JltFnNUHQJXlF4kR6lw3dn
	ugmPxzf+Kt4rNXW/5I57rmngSMIRThAmFlrKXj+3KyQqyIswcRksPQHD99ybspiMdCpM9qbhHNzFs
	g1pnvWBzYNPGN9SfpK42beJXlNEpJNptot0DkQrkL7XINn8oQFIr2hc1FsE1o/yKb/iH/z3LnG2x4
	g5ZvC9O0cWh20+mQ78T+6DnJcIcATvXI1YCyYhfaYmQyTNTdDfCRvfbCmSKWVYugeB71uba14Ga9w
	coW6+VRYBPCU435uWzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0kUA-0042IV-0O;
	Sun, 21 May 2023 14:56:38 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0kU4-0042HN-2p
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 14:56:36 +0000
X-QQ-mid: bizesmtp75t1684680964twajv9go
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 May 2023 22:56:03 +0800 (CST)
X-QQ-SSF: 01200000000000D0U000000A0000000
X-QQ-FEAT: cbck7jzG4waG0YqSQCoUiED+fzkkENM8m2b9Ibt81ixblhtyrHjoRlnOXvTHV
	+tLSras0SsLSIP30KnatlNf5/q4o72V7Xgw6EzJpGvpLASsoRSe6LA0mxQwTWX+D+TZ25u7
	d8o7f2AlWudUG7MqtXU23vHuoknvtTDLJVodUcIf0Aa9e+ugGt/3DfTvLr9uF6xnh8m1rkP
	rEjkX0vlfjB9Gl+bFGczv8X2zCH/KvPjHIQb28Y6k3v0Zeoq0Koh+BArvtv9dY6e4gOB6ZU
	iy5CK6tCsHKbP/Z0OMOjEq2gMIgTqynTB09ersXJDFPW3x/rDQe1+ZkHvIv2Wy4EVx6iNh3
	xjidtot5s9uu8n5DrycJ5MifMrUxn/tdjp8oajTPJL9gM8cCjROrdmixeNHS3GejssEi8sc
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17521047074454889525
From: Zhangjin Wu <falcon@tinylab.org>
To: conor@kernel.org
Cc: bmeng@tinylab.org,
	falcon@tinylab.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	linux-riscv@lists.infradead.org,
	npiggin@gmail.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	tim.bird@sony.com
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Date: Sun, 21 May 2023 22:56:03 +0800
Message-Id: <20230521145603.64751-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230521-pulp-canola-5df45b40474d@spud>
References: <20230521-pulp-canola-5df45b40474d@spud>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_075633_218706_E8A22526 
X-CRM114-Status: GOOD (  40.90  )
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

Hi, Conor. 

> Hi, 
> 
> On Sun, May 21, 2023 at 08:41:34PM +0800, Zhangjin Wu wrote:
> > > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> > > > Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> > > > the user to enable dead code elimination. In order for this to work,
> > > > ensure that we keep the alternative table by annotating them with KEEP.
> > > >
> > > > This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> > > > it only shrinks their builds by ~1%, a smaller config is thereforce
> > > > customized to test this feature:
> > >
> > > OOPS, I didn't noticed that you have sent out the patch and you are now
> > > in v3. I may read your patch sevral months ago, but I forget it.
> >
> > Yeah, I have sent this patch several times, but beside the suggestion from
> > conor,
> 
> Half the time my comments are just me forwarding on stuff from
> automation complaining. Otherwise I do my best to look at things that
> are being ignored.
> 
> > I have gotten no more responses (before v3), I even thought RISC-V
> > people are not interested in or not require size shrinking ;-)
> 
> IIRC, you sent a standalone patch, which might've been picked up had you
> not followed it up with a series marked RFC containing the same patch.
> The v2 which was sent on 14/2 was marked superseded after the RFC series
> on 17/2. And I guess since the RFC generated no comments, but clearly
> couldn't be merged, it was ignored?
>

Yeah, v2 has no feedback (I have put it in the dead syscall elimination
series who depends on it), so, I rebased it on latest v6.4-rc2
and send a v3 ;-)

Btw, where can I check the patch status? 10 years ago, when I worked on
MIPS architecture, I used patchwork to track the status, not sure, which
web site we are currently using, lore.kernel.org or still
patchwork.kernel.org? I use lore to read and send patches now.

> To be honest, I am not quite sure why you are sending some of these
> things as RFC. The VDSO thing looks like something that should be
> considered/reviewed properly etc, rather than "hey I have this idea,
> does anyone have suggestions".
>

"RFC" added in my recent patchset is really want to get some feedbacks,
especially, to learn if it is valuable to continue. As you know, the
VDSO is required by most of the system, so, touch it should be
carefully, and dead syscall elimination is another "big" change.

Thanks for your kindly suggestion, I will remove "RFC" if it is not that
necessary.

> > As I can see from the mailing list, Guoren just sent out a new series of
> > patchset [0] about size shrink (-16%), and include the one [1] from you, so,
> > I'm not alone, the left patchsets I'm working on and upstreaming include dead
> > syscall elimination [2], vdso configuration [3], nolibc for rv32 [4] and even
> > the self-decompress vmlinuz support (RFC v1 will be sent out next week), all of
> > these patchsets are result of my tinylinux [5] porting to RISC-V (got 334k
> > non-MMU rv64 vmlinuz+nolibc hello).
> 
> Ordinarily I would suggest that you contact these people and ask them to
> review your work, so that there is less for Palmer to do when he is
> going through the list on patchwork for stuff to merge - but it looks
> like you are already doing that, which is great :)
>

Yeah, In the past 2 or 3 months, I'm focusing on implementing the other
tinylinux patchsets for RISC-V, and have no enough time to ping
reviewers ;-)

> > I have found that you have fixed up some other issues, It is better to
> > merge mine in your series, please don't forget the Tested-by line from
> > Bin Meng [7] and the Reviewed-by line from Guoren [8].
> 
> I'll mark this patch as superseded then, yeah?
> 

Yes, of course.

Thanks,
Zhangjin

> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
