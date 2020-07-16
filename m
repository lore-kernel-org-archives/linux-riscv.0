Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B6DC433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:07:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78AC2065F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nHykdzIu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCv/Msoh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78AC2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yfeWQ5J+beaidWRvagnmcMoq9yGv1NNOGwZkZiw8Mxg=; b=nHykdzIucevviAM6u7FIvLsAJ
	+BHAs/LJIg0HxncDy8Kjnfk4TUVzZZrO2cVa3QoT1jmEBFY+DUQCFwAtBW5/DItz1AzAXhl1Z03gb
	2B0YmGGZkMQ8zxSSLOTHZfil6K7FjQunlT1QJN6xLgNpmjObYqTkXPiqgq/sZdCEbEtdktHetv2WQ
	43fPghkDrHIccakP8eAEeCqQAIaeVUOPpqERxDIdxOSH7Nrl3pIk0vSpsyzSD1KfeYHAMxV+O0T7w
	P0zOlq4m0GbkROi5mMxlqc6w1rRf+oGPH7JrIt1Yk4h7KrS+tSGMR6BDmv+yYK/Zt8gx/lHMzalN4
	s4vQOOA8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3bo-0005a0-CV; Thu, 16 Jul 2020 13:07:32 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3bm-0005Zg-EE
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:07:31 +0000
Received: by mail-qv1-xf44.google.com with SMTP id dm12so2636436qvb.9
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTCgb6pNfriHa7QdwxnKN0JEx+SnNfgA6oWTF7AfWbo=;
 b=cCv/Msoh8UW7Bm1Ew8GT4XIMHQ5AJwvGTe8s9LT94fF+PJeTQgsP+v5v1GAmtbExv4
 AZSIzhBLiBCorjt2hS6uoOZf3czaI3ZFMgL0smOQJjeSTYT/fXqHwrKG7qIY1e+MVnF1
 pdhbZMbDN4UFVQ7ArTXFQ1Wj7wV9UKXSdeZrHyxP6hN+L11P7Ft/kzJocP8n4wn9TRDl
 UR5G/QfuxcTytcAFVRnxVNxv8I13sJI6+uh+bcHqlhKRRdjngerDzHOHo5qC/55+MmTF
 Fcw0EL5Pk2ZUydhrgaAjpwPsvCd18e8CY8m0lkfnhfJaYQeKi8qj3zqARNnlmdcy5qDt
 yW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTCgb6pNfriHa7QdwxnKN0JEx+SnNfgA6oWTF7AfWbo=;
 b=Sbgqk3YKSKA1XPJbTtX4Q8vnda2wuSvMo5fnLtbGVwazfdxV977TKVxlw4sXka2GIN
 Bk7xYJ6AASKI7URQjF+127AM8RnxdpRrMa9OuOKB+LJXGSbkYZJ143la1sUBSWZR4xS+
 PLK96/XMm/v/27eqdIM5HeGJfuxfC3QVkSgG4n5E1hotRkIebDyJ/jLcezkncHO/tZhm
 gW4rpY0aC6w6qtrNcpAhoo9ihpLDSKU/mrj7PApAqbPDZ/GL7C6gVyRtQFOYfEr+8nNK
 CmNyeSWc7UgDqGrP7FnWhUiIF4c6uwJjwVxTeZj87qyMyobLS1ePlM23yAf/4J4lkqaE
 YPHQ==
X-Gm-Message-State: AOAM533/YjT1K5wGjnb7xw8lInqa8JdVRN1ngN+UZHKCvfZROHvhC5kf
 94aw6fzSwC59UWMHlenslcuakiWqSHvBI9CsM2wpcyBLE7U=
X-Google-Smtp-Source: ABdhPJzn1A/7btlIYG1X8bKeCTor+oIvCx7P+mI1jm4vqroo6Gd9feuKoyUcA12m6b+vBd3k4GzVkMJZVa3kylzK+iM=
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr4073553qvz.114.1594904848734; 
 Thu, 16 Jul 2020 06:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594886530.git.zong.li@sifive.com>
 <628efa24c79a493e39ce6ef13017ae52eaf13388.1594886530.git.zong.li@sifive.com>
In-Reply-To: <628efa24c79a493e39ce6ef13017ae52eaf13388.1594886530.git.zong.li@sifive.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Thu, 16 Jul 2020 16:07:12 +0300
Message-ID: <CAOJsxLHrOjaUVUASz067_VX8tYV2DZgR6pvK4V07+ZvhSophPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: Fix build warning for mm/init
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_090730_497534_F4FDAA7D 
X-CRM114-Status: UNSURE (   6.05  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 4:06 PM Zong Li <zong.li@sifive.com> wrote:
>
> Add static keyword for resource_init, this function is only used in this
> object file.
>
> The warning message as follow (with W=1 build):
>
> arch/riscv/mm/init.c:520:13:
> warning: no previous prototype for 'resource_init' [-Wmissing-prototypes]
>
> Signed-off-by: Zong Li <zong.li@sifive.com>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
