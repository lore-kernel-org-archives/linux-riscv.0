Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A340EE3F3F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 23:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4sZ7iGHexga5APkeHCkuv+ylw6XMEPVN9pwxUs4/Bc=; b=ylF3z5OecjTlEs
	UtCsOcxCwoJUrAKFHTQ7189Wr64f8SjB1YNE5WKF3vUfBSIA4rJxFswPCtQOw7otxGvPfYHxo323u
	ZeMBSagmxcWWXk/9cFfHZqTOYiu/RS6gKSzNy4rfLRM07FR7m8C4C4gvS5kDEtS8i2+2+pBPQzL6+
	IzjbbIcNelikTOKFEQrqcKcza6l/jvPQhuzlcU3zI3bRCRbewlkpZM91fXHLB9ZGkKf1HVu06V69J
	Y4AW1H+uNSJWbs3IX+U0Ugj00pt2thJ0YaLtyDH0+35Jn77tWzX7GqP1tEILcgbuEGv1kpwPf7e+v
	r4PixmcIlv1YzAVfVZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCQn-004F9C-34;
	Tue, 12 Sep 2023 23:04:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCQk-004F8L-24;
	Tue, 12 Sep 2023 23:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Xnsts4Cfn+cOT3sGgRWXdJJo7XuO0f7Sydd31WHTcA=; b=l1RiQBK7aQEeAsxzffD6ydEe/f
	NM+7cytrM7BkaxV8cbnuaUSMNBrvTLl+1kI6ycPclYye8dQeFhv6BYOZ5d5lDyTkq7p8yRsWccYMq
	nOLM5MDkKFXrsC52KEyCubDJflkn4N4KzOpbwIvg1CK8cVHV2xeX2HXhLWZbjB7Jgqvkw5IfPB2/4
	jnlEVaw8jyP5ATaifqb6WdAKZa8ftjMdlEbrSPwalEPFEKYIdhoeGJZwtWyqW/TQR/kxWH4hdDs5j
	5PRd3ZFf+lSo0hiVCswIub4eXPhFv0buNl6FdPSAq3eSvp599F4IZ2+mb2sAbrNukx9zu++JWJt+3
	FmxzjG+w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33570)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgCQF-0001kz-0s;
	Wed, 13 Sep 2023 00:03:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgCQ9-000384-3j; Wed, 13 Sep 2023 00:03:49 +0100
Date: Wed, 13 Sep 2023 00:03:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Wang YanQing <udknight@gmail.com>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with
 B/H/W
Message-ID: <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk>
References: <20230912224654.6556-1-puranjay12@gmail.com>
 <20230912224654.6556-6-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912224654.6556-6-puranjay12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_160426_702759_A1FB6155 
X-CRM114-Status: GOOD (  14.48  )
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

On Tue, Sep 12, 2023 at 10:46:53PM +0000, Puranjay Mohan wrote:
> The JITs should not depend on the verifier for zero extending the upper
> 32 bits of the destination register when loading a byte, half-word, or
> word.
> 
> A following patch will make the verifier stop patching zext instructions
> after LDX.

This was introduced by:

163541e6ba34 ("arm: bpf: eliminate zero extension code-gen")

along with an additional function. So three points:

1) the commit should probably explain why it has now become undesirable
to access this verifier state, whereas it appears it was explicitly
added to permit this optimisation.
2) you state that jits should not depend on this state, but the above
commit adds more references than you're removing, so aren't there still
references to the verifier remaining after this patch? I count a total
of 10, and the patch below removes three.
3) what about the bpf_jit_needs_zext() function that was added to
support the export of this zext state?

Essentially, the logic stated in the commit message doesn't seem to be
reflected by the proposed code change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
