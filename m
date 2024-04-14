Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205B1C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsYSAC6Y0oc5+yxSG99o6E8dsSilvrxpNQvY3JyqVOo=; b=N3sfK57A6xKTtk
	ODwHRJWeDN97k6NIjkn6hzqzm/PsxJJ936IsG6aMYBFMc31x0x0Ly+PtNgqZTj9/lyO49jNFKFiMh
	/JxvJTW9JDDt653BkUvXgS9FvEVv/zSgpQW+cPKRsd3BI+H9Hr+65jPGTTZwMmqyRpXbAAtZmSR7A
	p+sMA1f6tibbTR+kcWMC9kbYW8a3pjw60PUlEakKSQO5LcScS3Pyik2rqWuln6dQxjglikM16EOfO
	ZR2AE4YnXsQS1CDVakN3P3cvajaaJP5O+icJ7u8jT2jZ1Gi51xjTdA7lFwUS90+MU+12Cxz6G+T0Y
	j9lOF8wh/oTMlSwZ4JaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvnfu-00000004G7n-25lv;
	Sun, 14 Apr 2024 00:24:50 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvnfr-00000004G6b-20sq
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 00:24:49 +0000
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43E0OBpU010410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Apr 2024 20:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1713054255; bh=qb/AK26peA9M1+LO1ejrXo5H1qOcrwEngc2lVcRQn9M=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=gMW+j/eEZZ227dKTw8qgb3SuQZg06xUa58esbWcXoX8dpUZB1en0reXXGStK9DAcq
	 2NGcjQX+f5Uxytao5c/IPST/8CAmKWJQ8J6giqwWVbMycz+Bs3AkizauEhbKqhSYdN
	 DxSIOVCkhv9XEe+HuIh81hyJ1XtcdtxK9wOdZWilsJ1GPXStJy9yi4B33K7Ic86xFj
	 n7WqCj8j1P4UC/ednNZ22PYaGCw73K4CnGamuueyD9KjtGgqHil7hhIblz97bVYW+d
	 0Ys+GZuvSoQtAVvgck4WiGfLlErZ9Tm9PdwdNLSM9aBxKsUrVPpzmw+NIFnS5NBnw5
	 ycfENAmksYO9A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 611C115C0CB5; Sat, 13 Apr 2024 20:24:11 -0400 (EDT)
Date: Sat, 13 Apr 2024 20:24:11 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Nam Cao <namcao@linutronix.de>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        linux-fsdevel@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        Conor Dooley <conor@kernel.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240414002411.GG187181@mit.edu>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240413164318.7260c5ef@namcao>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_172447_705543_5F87BC24 
X-CRM114-Status: GOOD (  16.24  )
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

On Sat, Apr 13, 2024 at 04:43:18PM +0200, Nam Cao wrote:
> 
> I have zero knowledge about file system, but I think it's an integer
> overflow problem. The calculation of "dlimit" overflow and dlimit wraps
> around, this leads to wrong comparison later on.
> 
> I guess that explains why your bisect and Conor's bisect results are
> strange: the bug has been here for quite some time, but it only appears
> when "dlimit" happens to overflow.

So the problem with that theory is that for that to be the case
buf_size would have to be invalid, and it's unclear how could have
happened.  We can try to test that theory by putting something like
this at the beginning of ext4_search_dir():

	if (buf_size < 0 || buf_size > dir->i_sb->s_blocksize) {
		/* should never happen */
		EXT4_ERROR_INODE(dir, "insane buf_size %d", buf_size);
		WARN_ON(1)
		return -EFSCORRUPTED;
	}

Just to confirm, this file system is not one that has been fuzzed or
is being dynamically modified while mounted, right?  Even if that were
the case, looking at the stack trace, I don't see how this could have
happened.  (I could imagine some scenario involving inline directoreis
and fuzzed or dynamically modified file systems might be a potential
problem=, or at least one that involve much more careful; code review,
since that code is not as battle tested as other parts of ext4; but
the stack trace reported at the beginning of this thread doesn't seem
to indicate that inline directories were involved.)

   	    	 		    - Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
