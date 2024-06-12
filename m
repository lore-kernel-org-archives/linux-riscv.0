Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2501C27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqcCuSoEuhEWbQi/nfXij7bxUmTtTqnPWZoyOkui1+E=; b=YXxt1eQQANodsI
	2VMma6SqK+CVVkMAa7ObHyE2c55A+5IfJ4GkH/+IAUbrQM6fmf6mU0TNU5Tyvdp44h4ED+OZ5Isma
	9kJIj2WoGs8NWfVTgnLqI6qeC5sa6DGA6uaCnal9uaDVad9OhlaLdHJMgIdSY8pcY2uUIsmyWn1TV
	vtAU5O1R7En5GAAbqEioOxqxxcFnNDOU387xOUfjOQfA6T2ZaBIemMbPp7AGIgmhvg9d0G+laFscy
	UbbBSXnAF8NZicDbavrGwCTcScOSetwk3HLLbe6BuyQs1CfA9z4mI5CD+JXAUp4OgAU8XfGgaDYiB
	rMaqM3xClg4LZkQrDzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPqR-0000000D9tn-0DhC;
	Wed, 12 Jun 2024 15:25:03 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPqN-0000000D9ss-3ZFn
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 15:25:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso6936411fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718205896; x=1718810696; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfHSD2ohGFo1bJLqaYnJWptznLHGgS8ba5sojTCQFak=;
        b=AAFzlReAh3j6J5OzVkYWX5pbDak9w99PNIdgmBGc+Zz3pKFZkjMRWgehPeVnVf/+3A
         Qk2+24B8zcSX5PtGk+/LdwxTG3erbnmsLtZiKNZoz0JUFw9Z3eu6J2ptEpNd1MxzWZx2
         bhyzOf+F44x6wPd0bHx+AgltByvzCh7Kdn6MQySXQZeIo9qVWkAFQf2VQSzDCzwM9qd8
         1upXofy1Lmb9pLcNRfb8lTYTt2CghuFBIo5txJX39h5tQaQZaCGD1QfDeW4iF02uVp1S
         kEAcd7OGO0QYac8Xp3gb84q4WJkD1Fv7N/eQK+45Lkl3ZqSWwz9mAx7FlnoVostlehi1
         eHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205896; x=1718810696;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfHSD2ohGFo1bJLqaYnJWptznLHGgS8ba5sojTCQFak=;
        b=iIfSO8VHuplSkxRn5qhlLQNGev2J+0zDYqCB6O2yGa01IpTbp9aM7lWOP3NtI36/f/
         6+ZPYvZ/HdXwe7OPwje6Wrl1REfWxsKaLeVvCsc/nFnbsU6w+HJatVWdcGkVw0RtP115
         xdw9NdR5dhN72RA58HSbb5/jbizWI8PPVaYoWpkDUyacOI9d1RFmnQm/zdYEeSVEuFdA
         ebPyYyt1olv+vCAjANEOlfd8zVst+pcA8gBwy74Opt3VI2nAwrtm6I+2W4uezmIJObDB
         lyFQUydlVxrz+BsV393gF+pdDbwdImaf47HjURuLr93aY7i+gxGp51s0gV6BmQ+yQNK6
         ZcrA==
X-Forwarded-Encrypted: i=1; AJvYcCWZjbyMUkaWFc2J2YvGSAnxHU8U2Ttg0JiEcviTrGCXGqXvk1DwWvRb7IAC/dloCwwnr8WbQflSuBlCWKmy0ZOBxiAzxwzXmpmm0D/9oldG
X-Gm-Message-State: AOJu0YzRc+vkX4e4LVgqi6ATFtR+hGI0VcI79g1zWjFxH24RjfCSXozG
	0jnkOqsD+zP4upBXBIA0COHhQ9LCF50ZK3tugrKn4jR69icA8j8aHzEyiwiNsHE=
X-Google-Smtp-Source: AGHT+IH4zw3EWMR8z6Xw4xToTAnfHYkARCSUOo+5ApT7OA4n06T70RJ8V+bqVpKPZ0cStqBJHw7VNA==
X-Received: by 2002:a2e:7d04:0:b0:2eb:d963:d8cc with SMTP id 38308e7fff4ca-2ebfca4766cmr16758761fa.49.1718205895563;
        Wed, 12 Jun 2024 08:24:55 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422899b0cdbsm16835855e9.0.2024.06.12.08.24.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:24:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v1] riscv: dts: starfive: add PCIe dts configuration for
 JH7110
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240611015200.40996-1-minda.chen@starfivetech.com>
Date: Wed, 12 Jun 2024 16:24:44 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Message-Id: <98031697-93AE-43AC-B192-44B12CB43EC5@jrtc27.com>
References: <20240611015200.40996-1-minda.chen@starfivetech.com>
To: Minda Chen <minda.chen@starfivetech.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_082500_093559_E2621451 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

On 11 Jun 2024, at 02:52, Minda Chen <minda.chen@starfivetech.com> wrote:
> 
> Add PCIe dts configuraion for JH7110 SoC platform.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
> .../boot/dts/starfive/jh7110-common.dtsi      | 64 ++++++++++++++
> arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
> 2 files changed, 150 insertions(+)

Is there a corresponding YAML schema?

Jess


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
