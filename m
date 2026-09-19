Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F60C982DA
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89/22NkYmoKyGurNW86Hc/muVggVnshdEvulVHenRXA=; b=gu9IUmG1WpSE4n
	SDXHfrSG9X9qGDhA3yy8eed/nLuWfTQviPQAzOZQ3AGIWD+wCBmRia6nXLzM1ySfgZIQS+JlgKlH9
	CSyfCpiHsdkubdswtIzn3amwgaxHd+3Dth+s/GZ+PXk5QC4usbH2cnUI8ZTigRFYkNRibewpedPEE
	Ad6jFUU7bpbQV+Npl1/6LSJEGK3gaOvw8PaM5NL82Jz6dtHyQsLjZwtnzazIoWllxU6ct/gBnTCYM
	ANHPeoVcQeCWZr1uFjEnRpsaNLEe67ARYcgSmFcsCnpO1BDiQUy4upWJChA+i/BMcuH0tZBe2QXDh
	Q1e3b0VQREwdpMKanYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ti1-0000000GEEs-2S7n;
	Sat, 19 Sep 2026 11:58:21 +0000
Received: from mail-oi2-x0f.google.com ([2607:f8b0:4864:32::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7thy-0000000GEEV-3WOi
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 11:58:19 +0000
Received: by mail-oi2-x0f.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1210797a34.3
        for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2026 04:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789819097; cv=none;
        d=google.com; s=arc-20260327;
        b=miGAvhg3Q5vcug59gamoHZczRfI8o8cbm92WB5gkyBamkKkDVnqgZIOpXFlaf3qdr1
         S6D0ZWR73LowaZtBcdYw3vR/46UJwo+Nu3o+wTZHDAXsRcd7zp/zfQnwo3P3w8eEiRbq
         GV8O9IQR+M6tpj3MGAZJA6gVne0Aeu7MC/egzfCci/o9jUFH90itXAA1cSIo77+BSnxe
         vvoegw8GgqT2/5F6RsCdEZfu6CmvRp00jXnYkkXIVB0PdN6u2rA2L6XoclyG+Fx1GTL7
         TnuUOCwrUruMDVd2GGgjVWFyQDPlaDyhOAzQ7xL2nssdloRef9NzaSnqO6cjsTCo1YRg
         SnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        fh=seoTxy94AwaZekzFvbMVGrP8KuUeqlSOIoJWLy3+nqE=;
        b=INaXK+LLdC+0lK7GqKWMWZqGXBJBvtkxB3s6T6COKU5p3w4fD4+oUU2vvZGG08rqv8
         voMBoYa0KsRn03SJYvlLTvV8OtkGWg7aAC2DoZcIK1o1qouXl8oNsE3KFlJnIWwYWhff
         +RbGDMuBxQ4RiGzqUU36+84JV72aueso79DzPevY/2NjBaLHAfGdY8ktvg7x/L+pTb+G
         rLONzvRe2TFz00IISkkV799aaTQC8lPAySzxpkhzRBfBqGyu5Xuwsz8eM3iKj3Mm8rHL
         2NPt+Jv0+Yk96e8vLu8POsfzuX0aJb8oayxbusFUvPiYzyaUHX3I5yUsZvdK+2EE30sf
         0xAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789819097; x=1790423897; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        b=Dvq+R6TWyNJJbxa4JoBZYNm2vxnsFxjXchT08/A9U09A5Wu+PWzrR0hhs97CQw1SEb
         wJy/Z4fWqFhFrlRivnoa1Ln7Jhh0X2ukQgm5narSD7Gswj57mm1YxtIaSqHCVmx3KnyT
         CiqH0HWUBR5Vozioqx2BUj0usiVCVM1kWHPax1NISBkikbDCk4m80bnArtHOFZG8FZ8W
         F1lU7mGhCPVn3iB+TlwYQXwWlgGSOveKJVjvBLJLxGxuRSDaq9KBO8RU1tvZsIERz1CO
         dJ/Ri0S2J3HYBnHZ1wtpuOeUZ52E88R7de0VycgR9uNjiTbyOoyvSJmxyMxeMNvmUNuN
         RkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789819097; x=1790423897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        b=T1VQPO8QZkXq/7DwokAjyh0mYFzMRyAUe5Oc02nwts+CFeqNPwBjhaEEn25Inncd92
         y9Fy/NCEr650pueHl7PDM8sAxTNEJJYNTLG98NdWz3xm55CKsvVqQKKaljgkvci7CKFH
         3erEfs5XXN4pjnLjsQ7INGCOUzAYGAt8ZsxYkqokId12kuD5eCXgg0GQHTe9l6QvrLRk
         nWnx51+tk3V1WPdePlMb21fFr3I0OC3kkluYYUuB76ng42ABYkF0vYlkVzugEro9xlxX
         n+vNy+w/sWoEaw9QE0/bdtPNMH89wj1L+Zq0jvU/bDpYCo0Vk481qxMUo/jk6oW1CHVR
         2OPA==
X-Forwarded-Encrypted: i=1; AKwUvBysIBm4HYCcTH/Q7QiwWR3k98CHyZTnhsDsq99aJZlwfx7VsFPAW28poWOLb0+m6wZ7NDtsklLJ7cLUOA==@lists.infradead.org
X-Gm-Message-State: AFuF++mwDjGAVPnZo1wVA+qxSAodYk7khoj9v2U2yeMuXLVzxrCjE9f8
	GpYD2LnrjVKKpB1PKjWK9s2A+BD9mZbd273FGuK8hMj/HPAi9vqw38899i2PZpxMCI0VcCvqumb
	veLb481QOMaxWqpESeXqG7eij3kNXZUm7iQ==
X-Gm-Gg: AYBFou1bn62SvXMgrF+AoDZ2SepBiCp9s+RwnlPc+WRHnrJzvQ4UIvllDlPJ3FBiwUD
	COjamzeoNI8BSltqizJKoapYnn9ppSj/tcshbZkttsu0EdQJsay76ZyexbVvk+Xn0YI4wVMjhDW
	Im5FagxoKmoDN/44tMm5ht1wO1h84VCnGZZR7LIOkN1LNIdcMbPfE2kzMdoWOdTbQlJTZTAh/uf
	JbnHHdasBUVFOGWbaWY1tMhNhcTYJ9Uxx8Oh2FgiQToAL2QUmuZYSQ6YLZmfa0Eno790KBtkDwJ
	kp/SdhI5SAXmQnKCBOyAreyooZzkm7s2RgS/65U4PjXzgW7AqlwPeh3vRYb6Fij1FITM9O3YJdS
	VCwUml97d3wbLfj2fYhPmughzOE0VeZzQu+tqPA==
X-Received: by 2002:a05:6830:442b:b0:806:1728:aed9 with SMTP id
 46e09a7af769-80ddff5b5e3mr6811507a34.5.1789819097212; Sat, 19 Sep 2026
 04:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
 <20260907155300.1411173-1-alan.tseng.cs@gmail.com> <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
In-Reply-To: <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
From: alan <alan.tseng.cs@gmail.com>
Date: Sat, 19 Sep 2026 19:58:05 +0800
X-Gm-Features: AcwNN1UZXEwsL9Pov5f9xi5w8glGlreCvMt_9qTwCiXunjbXeU4yHhZxeZNHtl4
Message-ID: <CACwt7EYh9+MZHC7Qn910iOxvnjd42u_NoSX3+YpjQCxCxtY=6Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: dlan@kernel.org, adrian.hunter@intel.com, ulfh@kernel.org, 
	long.wan@linux.spacemit.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_045818_887318_904FE337 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, Sep 15, 2026, Iker Pedrosa wrote:
> A jump from a minimum window size of 3 to 50 delay codes is quite dramatic.
> Could you clarify how 50 was chosen? Is there a specific hardware specification,
> phy datasheet recommendation, or test dataset across multiple boards that
> justifies this exact number?

50 is not my number; Yixun would need to answer where it comes from. What
I can add is what the vendor driver does. In SpacemiT's sdhci-of-k1x.c
(bianbu linux-6.6), the defaults when DT says nothing are:

  #define RX_TUNING_WINDOW_THRESHOLD 80
  #define RX_TUNING_DLINE_REG 0x09

The Jupiter DT overrides both together: spacemit,rx_dline_reg = <0> and
spacemit,rx_tuning_limit = <50>. So 50 is what the vendor pairs with the
finer delay-line step, not a standalone default. That makes the 5/7 ->
6/7 dependency concrete rather than theoretical.

I also need to correct what I said earlier. The current driver already
centres on the widest passing window; the "< 3" check only decides when
to give up with -EIO. Raising it to 50 does not change which window is
selected, only whether tuning fails. The 1- and 5-code windows I reported
were never the widest in their boot (the widest was 74 or more each
time), so they do not show the old threshold picking a bad window.

On the form: spacemit,sdhci.yaml has no such property, so a DT knob
would need a binding change. A compile-time default, with DT override
if the binding maintainers accept it, still seems the lower-risk option.

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
