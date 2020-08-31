Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB05FC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:49:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96250208DB
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T5x5ZVNY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUMZJ6tL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96250208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dx24J+YSDLK+6oMAIVt4FqUjG4Lgdv6t9JvVl3ikYAk=; b=T5x5ZVNYX6jokkiS8Wd0VNQFq
	iQvm3yWwhJwB05ODJSg3pHomzBnwgqu8ko0ljUAFtDjKmh2S4DD5R5mi5kM5rTxUqh8DgYly0Ygfp
	whz0yfzrr+GvhE4VDqDs+QoZ/ryjTK/cu/iI6wXpTBM+Zhd6/208mFcIeebzfEuXKTpK1+BqQOm8k
	kd5OzvZEolPTSQf33ZlDKpFtO0ZaQJ+6xDiEWV8RwVL2FcDeUHFphnhDl0ONIt0IM4+mG1yd8C+pW
	skElNF8ysNUKCq+zdTvvlaed5thKR6HGiLOqfgMnu+xG0WRztK0pQVeQAYzGfrovBFXxL90Gy9Lnb
	pxa719PAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCeZX-0001RI-9j; Mon, 31 Aug 2020 07:49:47 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeZU-0001Qr-5b
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:49:44 +0000
Received: by mail-ed1-x542.google.com with SMTP id ay8so4500153edb.8
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=akEiOdpS0Gg/fXyATJX/L6/L6imxqJBwCo+dknusM4c=;
 b=PUMZJ6tLcuQckS1up2hcmWmvYFTTItBVxCwxZOzgkclNgkfW2zxDrbOeyvIbA8smGM
 6Rmio8WjZDwImOBaI39ZcQV0yCpysOK8gDN3IeHoXbVhuSPnCsCE0V8mdGAlY3+Dt8QW
 OvsN9JbyoxW9KPB7jwWkSCoA+NjH5x1ym2rLnPEp2cYP6LPYFc2k8FjYHShH++l/o078
 QOsadrQjUk18bJjE1ALasXMIb+ot42DsTLa/3zwM8V4L31YzOLhP6fDewecqTQT+oLxH
 CYUxl28tayNt2u/MJLEZKuiClb8uqRzWch6m0AiGRiaXG/eP2O1jAvKcWYvPdMxx1Qvi
 5Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akEiOdpS0Gg/fXyATJX/L6/L6imxqJBwCo+dknusM4c=;
 b=S2Xk8DxLQ6pqjTLZXRIYnD+kMF8DEB1+XC1PFmbInwJ6tHYbXHE4G1gvjO6P0gLzcC
 90SP04t65+FYguEUcr6xdmkvJUQTBk3BzJn0VvgmBp4zUJjCnrl8buZtiSIbJQOiJodF
 qzHYSTpzm0SkNsQUK6DSZ2gqa0mKofte1VmLQs1e8js4o5DhghMkquq+l9hQO0kasni/
 TBxVvV8yCRMqNWbqKPuLDFNWIba4na6Y8/niJryxcLSxLoSJYMYcHXXVlk30IvQ02uZL
 eNWg/Q/fdKeZejcy9hKLkNHcc2MdLUzFarrUXwcD7doC6TtcLJxtsNgoStLzzOQI+bc5
 B4yA==
X-Gm-Message-State: AOAM531UoFMS2+HPS24c+o68n7WhA1Us6eXaG/fhlP4gbsC54TKV/vbR
 MJI0oPgw/bf7qGEjjO7EVGSquSTMgTbIFzsm//NDWcTkCWQ=
X-Google-Smtp-Source: ABdhPJywkdtbMb0DPS7FRH3KSjaBMgwx1BxD4mdOzvbs+JVIYp7rXFFxjiYVe5KcgD3G7V74Z63uwbYevV5+/VOOvbg=
X-Received: by 2002:a50:8d4b:: with SMTP id t11mr57219edt.5.1598860182770;
 Mon, 31 Aug 2020 00:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598859038.git.zong.li@sifive.com>
In-Reply-To: <cover.1598859038.git.zong.li@sifive.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Mon, 31 Aug 2020 10:49:26 +0300
Message-ID: <CAOJsxLEHer5c-BPYnH6i_TW1iEJ+t4iF_8ZU49=Wvd2wSJ9+Gg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Get cache information from userland
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_034944_294488_0F6A9875 
X-CRM114-Status: UNSURE (   5.03  )
X-CRM114-Notice: Please train this message.
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
Cc: david.abdurachmanov@sifive.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

For the series:

Reviewed-by: Pekka Enberg <penberg@kernel.org>

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
