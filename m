Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F859C282CC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 06:28:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D6A2070C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 06:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJNuwY8P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="x8iCobPh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D6A2070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5MLQzDUchDgawA7F0W02lL0JjdBKnGgNN4Asl5iIJ8=; b=NJNuwY8PY/bzUM
	2WXIvdTNNgE2xmCRE+WA7DImU8exq2Q3mWiYOzkohDYDkyosVJYY8sDdCu2PLHW0QUSt46CKPPhKU
	W9mcaBrMcwjs4/j0t/e9IPKUV+zKDfy5gNEIyLfWWxSiYGbn5XeWw3H7vzgTnuuCgrhjMlC1Yf8+A
	HhNhA7vDVE7uv8SD9h/I/WyAmplTdsAL0Zsir0xhrHbFLeGvAxmKdvi56mQXww3JhioelKMmfBXDZ
	ldn7sJvM6vgjnaW7YxuafETuDX8eWQGEQHp+TyLH6OC4UwDh3BY2CTlyvVbIZM566cWvuvRUUcZUZ
	OQZWTBkkxcDiJD90K0EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt54R-000770-Tm; Mon, 11 Feb 2019 06:27:59 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt54O-00075o-Vr
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 06:27:58 +0000
Received: by mail-wm1-x342.google.com with SMTP id z5so15133864wmf.0
 for <linux-riscv@lists.infradead.org>; Sun, 10 Feb 2019 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdYV9cBrNvxpAafw74yMbiJSEo0ins9g9PxDhrTBATE=;
 b=x8iCobPhM5PJ5ha+Fn+ZQ6U9DR6yh70BcZwChFnMYQ+R42EtjW1it75U1k0CTvfzct
 xjoteCg5bx4w5X4a/oHWSNkitjlmWM7ak3aDuLdlhUcR8GEwN+U+DH56eZtP4jhaFDiu
 4olVsaN25xKPSOsDjcJZhttczZdbSJlYM5ItGF73qZu+BQUvrJo9Hhcqsev4mUjIEEk6
 9t53uPR0ibdi1c2sDH1T+TcKQooWSTBNKVg7vghO9ta7DQmkJKO+7ssR7/RnAeTnDFJt
 ebZ3ZHma+f5S+bGYeNhYOu1PCzHgje4fVLDAqae1gnKj407FN8f6klMSNUV2yiA7x7so
 gBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdYV9cBrNvxpAafw74yMbiJSEo0ins9g9PxDhrTBATE=;
 b=fdfXDWrFVDVF8uIUnys9htMd6BD7yEhwBEmZlalg3sKZ5YtRXvAB3N17l5hbmeCWEE
 pN8/LqEKXpceNpB7gbsSq+XZddXmKNIQqtI3sEyB5R8fwQn64K+Utdl2GUPDlXOod3xB
 VY+RV93pIFVz5a9stQ5PqUWKlxX4FIbCjXBHCnNDz8HuQGlwLWrR0rN2uuMCA/xNYsp4
 ThwpwPREkBPM3+NelbUOev7d/ChXpIFjXmOU6jJFM7OSo1BmL192ALM6kLh6qlGn2AZz
 iHxFruDeKwzToUPtKSJdzHCUOU88jr/s9qXkHXcXJvT6K1qo/wM5m7T32dUuxL/ywiPc
 LSaA==
X-Gm-Message-State: AHQUAub938JDfJc15hkzayKERGCPIziiB9z8fomfCCz69hIhuKRUkcdU
 bCiUROYu7q9CBcnWRYl/1gW33XY064nZ0Bu/97lvAg==
X-Google-Smtp-Source: AHgI3IacPZSJur1z2d1314FofV6UNJQdCNNfUqbYzPRMiBuHGHFNsgZIN4lncKc4sZmLmiU+qXsWEhmaEkOqqlECRxQ=
X-Received: by 2002:a5d:5004:: with SMTP id e4mr28020481wrt.59.1549866473927; 
 Sun, 10 Feb 2019 22:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20190119132650.9978-1-anup.patel@wdc.com>
In-Reply-To: <20190119132650.9978-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Feb 2019 11:57:43 +0530
Message-ID: <CAAhSdy2t-L6EtZ9a7Cv=-rVtzpfAyC5nKW72DUWOiYsjXcgJtA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Fixmap support and MM cleanups
To: Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_222757_072910_2EDEB37A 
X-CRM114-Status: UNSURE (   4.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi All,

Any comments on this series ??

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
