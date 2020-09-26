Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85217C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 19:14:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54D921D7F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 19:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hp2mg4uT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54D921D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ki4wRWSMPEtp26dLMUQHoG/Ue0C1S2vsQDOkTPVw4Ks=; b=hp2mg4uTmkv8CyY1vh/PSQj7z
	qvrqDn8LiMBOH4O9gQ1uw2BA+jyGVQRFi1fxdIm5Pyd+xJ2gLM6pPorTeDNzkXnLSbacUkxfre1Jt
	nT0IzVY28btG1+1AAd2dohne0Fbz73w3XaM/G70DK2lm56AnkSS+ZkX6Bm7rqufWIR2X9iV0B4ry2
	qzi2XzINgiGgLvdDC9TNx+m4jAcHopCtJ/PQ6lbBMBkTu7QXd1z0v2e0NzHCTm8QjN4t4p1TmTxne
	ZWSkIPRF9Mavyr4XqrNH3ncVaSQI5MAAkqR89KxBxpkd4G40o0hPwJd7eopSDpg9jGXtDkAbTbn1Y
	cDtaDewvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMFe7-0004Qh-AC; Sat, 26 Sep 2020 19:14:11 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMFe4-0004QC-1M
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 19:14:09 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MA7Su-1kAk6t1Y6s-00BdYy for <linux-riscv@lists.infradead.org>; Sat, 26
 Sep 2020 21:14:01 +0200
Received: by mail-qv1-f51.google.com with SMTP id cv8so3270461qvb.12
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 12:13:59 -0700 (PDT)
X-Gm-Message-State: AOAM533wjgMOofOTC5zJYSJFOx8zMlGGAweZ1ZfR+CL7GGmMShaC7GD+
 7aF+YkaejAezRVavj+mTWZrghV6AQw6tTaXBb1Y=
X-Google-Smtp-Source: ABdhPJw/iwukTKg1GclSKE6lTSTpb5ucr5JoCxFL+sd07zV4NOrukIDXbARQdfOrxI+K+AB97dYshpN6f6+rdDPzfHs=
X-Received: by 2002:a05:6214:1873:: with SMTP id
 eh19mr4898917qvb.16.1601147638094; 
 Sat, 26 Sep 2020 12:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200922043752.GA29151@lst.de>
 <mhng-9b0b114e-a104-40b7-b4f5-ad64dbbbd5bd@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-9b0b114e-a104-40b7-b4f5-ad64dbbbd5bd@palmerdabbelt-glaptop1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 26 Sep 2020 21:13:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ONxXm_MWKn9BSswtLH3etVwOUh52NYoXpj032=WP0gw@mail.gmail.com>
Message-ID: <CAK8P3a3ONxXm_MWKn9BSswtLH3etVwOUh52NYoXpj032=WP0gw@mail.gmail.com>
Subject: Re: remove set_fs for riscv v2
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Provags-ID: V03:K1:v3V6V5gFA/J7CH3pr63O6hcjtDArWIInM2LxGPK5Mz34lwP5Gm7
 RAfsWdwCrvV62Ar7hA1DChG1OQGUqpveXwYtj2fBtOG+565VfbmAlQXH8C32g/vNuASWFCS
 O+AzvDoYV2gmPY8U6xK70iC/ihxdSLUktw//8Q9CcDE+pjv4TiSwpiiLECyd1v/s0u3IeSt
 dofT6ZQGkNLtxV2GcU3dQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:54nO7ZxMoIE=:xW4BU1v+tAv0lR4kmw4bOi
 5DEFTfZe7wWOk39S5LIB4kwds3lWI79ckz5FPb6nMaBaZiT+On4T/lgtRDz++bqQCy+w2dAEP
 VxbulekBvNfct8WPfaaKWXUrveY2COLQqjEPgUcR+9Hl9uyVG5xkxEhKhXSGDpphY4sLPZ8hD
 rDe2AkhzrjMKhje2CdsM85P48+Wa7oPZpVZyXAZQtnyiQ2x9/IyLr94ivfGzhyZM9tos9/mNH
 NEm6G+5Mf1auyPGCTw2hICQ/2qzl4zlHUzkxOnCFFnQa8Z5X8OEaDyFAw1eamzLoFhxIAHrBp
 dAZ4TkZLGCy01luDUq84jSMwGAjeQVKy/V+aG4gR9yXZTc+UEa5rOAnKmv5IVDOtJDHlUV21i
 uUAGi6XO7OjqyVGgMhwxiQUdL34eKKmZw+v4XYksBbD9FWjpvXRBNZdYchfehSrnBg1GSdMLW
 /EFXRuvAaASJLOF25+g2TcY0/50bpD/+bsrH3us/o5sTCZvXpD6hDWtd5jt31j+g/WVVqaMxF
 Fbx7NZXdcNTvcmJYtjZ9kAgxBSfHFirTMXvqfPyPI/vwlrbejZGXewKDsIzrPgyvmv5JhaiuH
 JAt6yqPaEXXQkv1sYi1+IIxAIH42JV93g6A686dLencCdfRe674/phLVnvkOK+UJbOoIhypk2
 XWsA7RaqtbkU3+j3XEr7DuiydjXS7PDKAZ9x5YD9pV6TwY03l82eeXHM10X192xV5sFxgum9Q
 o9q0F8NfWCGoQw9b/8FsXTYH5jkzXGTaZWK5GK/Gf6MCzBB9F/CcZQGtchVW9qLoTPIbhJgUc
 cAV8mBo+Z/ANQn3j4/g0lQ3U7Lr9dA6OgP0GkZNyyRpsFO5gDZNd/KjCvw/G1/lVZ1KR35Yb9
 j7YRdG4YDFWpTMhC8u0K3OCEcZBZlH8PGuEqrJZPXgAGal5k05BrMDBrZWSLMG1aH2Jenb1n+
 zo5y26gI6/fWLsl68H7P8qm2DPvPNVSOp3HZv94d1D8NYy1ZIOc1S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_151408_463747_AEF5735E 
X-CRM114-Status: GOOD (  13.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 26, 2020 at 7:50 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> I'm OK taking it, but there's a few things I'd like to sort out.  IIRC I put it
> on a temporary branch over here
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-remove_set_fs
>
> under the assumption it might get lost otherwise, but let me know if that's not
> what you were looking for.
>
> Arnd: Are you OK with the asm-generic stuff?  I couldn't find anything in my
> mail history, so sorry if I just missed it.

For some reason I had missed that __copy_from_user() change earlier,
but I had a closer look now and this is all very good, feel free to
add an

Acked-by: Arnd Bergmann <arnd@arndb.de>

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
