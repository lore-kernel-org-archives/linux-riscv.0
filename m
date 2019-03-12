Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0C5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 04:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1312084F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 04:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z/B+jZIv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="IXxsxPny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1312084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Content-ID:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9N4IQZXEM1O8ykHOeLfgMVvaKnCLsXM2ag+x4J9Ihg=; b=Z/B+jZIv6yJk1E
	1f2OFCTzU58j8j1rnatKKp5jamfaHVw0YL06Q8wlJPZhydm7ebAWOlCd/YAehpUY9J9wtfwj7lQO2
	NgMvzhEPMbj++q+94eiKOFMY66uuhThBu/RD0bBf5K/LdkcLjDSuK8otUqCX+C46CMqGyu3qCv+hw
	zEp+u+IcMzaTt1HGebH7BCHAFavHFl+Rb+Ea5TeLX9SR96gc1/QjOXuQ39KusE7HIVjpY2qFurgI7
	YSYeybZV6BTqJ2ytmdFzKHd6sZ6UZr19h72PgcdCY0WNEB2K3wZnmD5myCVsHavQfa2fjnj8vvFvs
	i0K95asRGf57zMhG4zbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Yzi-0007tb-8m; Tue, 12 Mar 2019 04:26:26 +0000
Received: from a9-46.smtp-out.amazonses.com ([54.240.9.46])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3YzZ-0007mf-QC; Tue, 12 Mar 2019 04:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1552364775;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Content-ID:Feedback-ID;
 bh=iN7UZChfXuJA/CCoLWDlbTQLCAWEJYZ2ZrD5X968Fg8=;
 b=IXxsxPnysoQytIRpPkuAdm6YMSQol+eDwGKQNe+e0EEmfuKNHn6iUF66caORx7NV
 cnBCLOWNFB2LJsKuA5n7/P7jtfSvPiQpPRZPy1LZf91TuevrFpDWv5VfjT1WyghkH+O
 o4C5OTHpVNuGQktK+314wiCrWelMLB2TwT3Di9fM=
Date: Tue, 12 Mar 2019 04:26:15 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
Message-ID: <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.1903112323152.32434@nuc-kabylake>
X-SES-Outgoing: 2019.03.12-54.240.9.46
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_212617_912342_EB0E72BB 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 catalin.marinas@arm.com, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Mar 2019, Paul Walmsley wrote:

> There's been a discussion going on in a private thread about this that I
> unfortunately didn't add you to.  The discussion is still ongoing, but I
> think Christoph and myself and a few other folks have agreed that the
> preempt_disable/enable is not needed for the amoadd approach.  This is
> since the apparent intention of the preemption disable/enable is to ensure
> the correctness of the counter increment; however there is no risk of
> incorrectness in an amoadd sequence since the atomic add is locked across
> all of the cache coherency domain.  Christoph, would you disagree with
> that characterization?

No. As I said before all write operations have to happen from the local
cpu to a per cpu segment.

> There are a few outstanding points that we're trying to talk through, but
> it should be fine for an initial implementation to start with the
> amoadd-based approach.
>
> As far as the ARM LSE atomic implementation goes, I'm not an expert on
> those instructions. If those instructions are locked across all of the
> caches for the cores in the Linux system also, then they probably don't
> need the preempt_disable/enable either - assuming our collective
> understanding of the purpose of the preempt_disable/enable is correct.
>
> All this is, of course, assuming there is no secondary purpose to the
> preempt_disable/enable that we haven't managed to elicit yet.

The intention is that the write occurs to the local per cpu segment and
that any per cpu RMW activities (like this_cpu_inc()) appear to be
"atomic" in regards to other processes running on the same cpu.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
