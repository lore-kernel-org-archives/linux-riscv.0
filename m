Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C375C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 14:56:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF8B2075C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 14:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9JsxvqE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="FV0/7jhe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF8B2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fOv6MEaqaV1FgPIvCs8i/tveJMq9MrpL7MdmlxDm9iA=; b=e9JsxvqEz/UcHgS+16eG07XLK
	EGG2EY8xrmBXQ2YJBz1P4Pe/vY5ucVVlCWNvmvaQi4/0oPfwW0qgLZBk4LdOTkepaprx2HYalNg+V
	Duo8SErZfLmYU/s2QidhoCLj2/rxNan9De4nhAn+ZDgNcLF+O1NbnCRvmjzuxw/AkOE5MgfE0awmD
	P7A7mSdWya0f+iS+KheRffg4ybNBwuNEv0ucFJ11mHdfonvfIZ/2WlY26cQVMa6JbCZPtdB4RYl/D
	d/2x6dFBhy96cTeBcrofskhbier+a4LN7jjcIpdtJxz8m5KS+AH5L7Qy9MiL87RVWnCoOg4mRtcti
	BfK/q3dfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3MM2-0006t3-H9; Mon, 11 Mar 2019 14:56:38 +0000
Received: from a9-114.smtp-out.amazonses.com ([54.240.9.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3MLx-0006qN-7c
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 14:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1552316189;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=2im0NeV++NfWYRLP+LketimzGws7myRD67iRePAMO/I=;
 b=FV0/7jheV4m1PJt58DkV6l7jvuFTGY8X9twRjOyb7K6cggMYP/R3bRHS86eiPYWz
 tS5GZ5IHdpOEIFs772oT5YaKK/+LjvwCVWh5cNYGLO4Vfbb70GFVsPUlVsJJATJQe8b
 tH2AO03Kq1SDDzxpb3BldVigqruA+yieRm0Lx79g=
Date: Mon, 11 Mar 2019 14:56:29 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
Message-ID: <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-106060045-1552316188=:28180"
X-SES-Outgoing: 2019.03.11-54.240.9.114
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_075633_373912_08583A20 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-106060045-1552316188=:28180
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 Mar 2019, Björn Töpel wrote:

> > Thanks a bunch!  I feel like the best option here is to just use the AMOs
> > without disabling preemption and ensuring that all other accesses are atomic
> > (via AMOs or LR/SC).  The only reason I can see that wouldn't be the way to go
> > would be if it requires non-arch modifications, as if we go down that path
> > we'll be able to handle the performance edge cases in the implementation.
> >
>
> Hmm, you mean AMO *with* preempt_{dis,en}able, right? (No, interrupt
> disable, only preemption.)

If you disable preemption then you dont need AMO anymore. In fact that is
the default fallback generic implementation. Just dont do anything and you
already have that solution.
--8323329-106060045-1552316188=:28180
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-106060045-1552316188=:28180--

