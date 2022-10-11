Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70B0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rLhiIXvrbVicj/lyvii9vl5M4Bp8DraMcorOT21JhzM=; b=hU3Br7bYrrlhykzg6NF1r23Vt9
	DAAA/GDKN1ArGSczU6xpajiwloz7zIqIPbflDlSn/Blt2pm1EXd+m11o5tc7MJpCL9SDJpnq2ykUj
	JXkXZw9+j6jMNblMsUD4uHhgdtoOsOLbETFZSLHOyL1xeGNGhlrRMP7VZ5vEr/yPNFNeNR2JSk+bf
	Xn6r9JUH41E7xvXTdVVgztB+Lrxi34UNH9mhZSMyAq5GBX97PMzlgdo0lZHkCx0lX1FHjcgn5HOuV
	tyUaBuPyBs2SOd0UcyUZdwQRVv1jBrz+9+QdkixausAQUwik8IZ4tu/alXcxjKKGuoqI22Tldz1Kx
	felszrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJrq-005Q6X-HE; Tue, 11 Oct 2022 18:20:38 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJrm-005Q5t-TO
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 18:20:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso16855745pjf.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mud08Qw1zOBuwvEnpjBnDa29qnCqT4jSMIR0JlM2tA4=;
        b=ZOGe1sPuC/gcbT6TjHoIYfzyA6ww7WoVLlBdGGZ5DRiRjKyrxmSJjAeSRj/58TL7pH
         4nAqnequcPT4hRqFgKNMmMfjc/LwqbSKAT3XtuXFR/j1u2DHrOaE2j4b4PoYDb4FMHHa
         g8l+uHY1hv8e23hf4Cf/M+ht5/1kIjn/rByJVAsyqLo+3D/9P3D3hqFzICQOM6v6sYAA
         14tVFhBKtWXNfBhpRfp/Ou0FaMq3Iwoz0tCLElxQPbHV9Gc9McXouVQuGN/WZG0fHGjP
         A2DEpzwWtI1FfMgT+9iMkjWobJQPXRYxUXKKEEMWwn4GPr9rEYn5qDgz5p0yeke+v60M
         PNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mud08Qw1zOBuwvEnpjBnDa29qnCqT4jSMIR0JlM2tA4=;
        b=dvwgiaJT+AEPwhoKjm3yBSa7Jk7b5LNN2UNXzB5Bf97qo+0egmODNoVENMYjhVFlXx
         YxDiIVoQf6OLSXnpGcDlpE3wybNMRa8WaZted2/pBLPcKdd34JmHpdhAxjjv9R8M50BZ
         lHaMgJqVBCfYGpwOJ4gbpmKVEPBDADAVbI5K7gL3U8uYWXS/x6SUzgPAjmOZxFUSjfZb
         0XNlEHNmkq/rMRVI7VrE28md4XjWNRPfMa2rxm0MJj5EkbGOZIFfX5i0HYYrn8wWCUuK
         6VLAPKeIV2sidsPl6CSgBL0M/EckykUQkFJMWMbzKVRwU0Zvp3UHAGEdDzYlQpFpsWpz
         wu3w==
X-Gm-Message-State: ACrzQf1vShqc2EMejhYBJnv6THoQHLkVtnqIpkHqgLWm2IZmLSCqJCrY
	1eiDv3vwfMXKG4BJjP12/aYGsUXjpWZc44ti
X-Google-Smtp-Source: AMsMyM4LehOBcUDNQcO+TaAhvfJ7XeIsow+8oqvuhNErrQsoSaBmUmJyXMC9bWWcjmkVp2u4sLaIow==
X-Received: by 2002:a17:90b:4d08:b0:20a:6861:352c with SMTP id mw8-20020a17090b4d0800b0020a6861352cmr425323pjb.225.1665512430913;
        Tue, 11 Oct 2022 11:20:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n2-20020a17090a2fc200b0020af33363d3sm11007597pjm.19.2022.10.11.11.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 11:20:29 -0700 (PDT)
Date: Tue, 11 Oct 2022 11:20:29 -0700 (PDT)
X-Google-Original-Date: Tue, 11 Oct 2022 11:20:28 PDT (-0700)
Subject: Re: [GIT PULL 0/2] microchip maintainers updates
In-Reply-To: <20221010221704.2161221-1-conor@kernel.org>
CC: conor.dooley@microchip.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-3d156172-2b15-4ef8-abe8-3eb251a528eb@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_112035_166322_1CD07EEB 
X-CRM114-Status: GOOD (  14.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Oct 2022 15:17:03 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey Palmer,
>
> Two maintainers changes that I posted on the lists a while back.
> Neither applied at the time b/c the maintainers entry was being updated
> in the soc fixes branch and in some for-next branches at the same time
> and they conflicted.
>
> If you could pick the two that'd be great.

So you want me to just pick up these patches?  That's OK, it's just not 
a pull request and that's what the subject says.

>
> Thanks,
> Conor.
>
> Conor Dooley (2):
>   MAINTAINERS: update polarfire soc clock binding
>   dt-bindings: riscv: update microchip.yaml's maintainership
>
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 4 ++--
>  MAINTAINERS                                            | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
