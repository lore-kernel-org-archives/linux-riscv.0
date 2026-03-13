Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F75105F799
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvEj3++9FPHNds+JLLbE8UE/gHPqKoWvpVvAQwf8IYM=; b=T03VxUJLWY4iYp
	q+pxzuEswnOI/xW3936Y/fpM1c+xJe3LVJl5DO/lGMriCAZvxCKYEkyQ1euV2gedF31mopZrThAo/
	e1iklFSVKDpNxIQdsFHPC0tIAm17pCr8uIQNEjwVKOcOka9HG+swN7jCAjkCIQW8ynyIxVxE9s5NK
	pkgmM+dYxxN5uH8TH7dW9OugqNK9QHNELy20dCzzpYLyrTnYnoI2hQU0RT5I5f+vfRRZXCdiQxmFt
	Ll59EfOsJYaZ6HS9ZCmJVWDG1xeQ7qCHi1HsuCZKYlgnWRXZXTii8pcSnRs4VaKD+d8idHdfGnu4g
	Kc8IJVal+mnAiO7oLILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10a2-0000000016q-2ohd;
	Fri, 13 Mar 2026 11:21:22 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10a0-0000000016P-1Lrn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 11:21:21 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-509149ab7d7so17107901cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 04:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773400879; cv=none;
        d=google.com; s=arc-20240605;
        b=RRBfw4Lm7AIq+Zu7AHOsg4kZKnths/G6Nj88F9DpcHjseE0irniaytyL3VB9OB8hoI
         sH6hGlTFPkI3uTry9mTkVwJBnZEoREg04OT7LIIpH1xCBE+FmTEMXSzwqoGY0R/Tagoa
         MMW1DhH+bKgvQPStWkjnvn1LuASYgE15vkrQIQv70n+1TnhJrl9FrpxjofJkuR0XrtKQ
         7+KyK894o6dX1W4fV0Z8Cq4LN0PC11dpdk5gwsSAAuycY/51GZMf19ObanQBpmTvZnca
         bbnOvEFeSeRVB8w4ATaJ7sIAKCiCZxKfeDGDR2S+xErOipWNfTL3Jwgiu5Q8egjsyYJr
         LYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
        fh=RSzT+zmy1GPYAzIsd/aaoFmJjU5Uu+WX/5gnYqu1dWE=;
        b=NlqG9SwevQC7FyYepWsnapqDSmbngVgHOOnEf2GFE9CVTcYIqcJWHqApt2VlqfYHrO
         8kR5XXx5CMLi2Hi/fP/BgBfMW5+3NtOIKLq/5wVHzZs0LY+nNbob2E+2ybs8hxmuzytQ
         iDMtzzRTxFjcro5ZUwZLZ5CpGJ3yvE//KfdS/LkfC4v/e/OkwZAvpNEjV82QKhXkB+9P
         n0X8pQ7yQj0MOrxAKTdPAACA4kmNd4122NO4+dW2JVDG6CQuSxHxPZzpx8P2dNZO9Zz3
         VHxXEmHkC47HmJdz6H5nrjWp1rGHGIbv19tO7Zb9ZdPm3T6OCx5acFT91Fxs7GMdkKui
         obeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773400879; x=1774005679; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
        b=ZQZr/rWwQk8xOGtFim2jCmdCjskP37fhl6OVx8zpOA6ky/U03OWRrIkIfN9Dk8rRqW
         vj4/jm0L83P6DPl3ely+Vx4whMYjKx7Rd5JAmueLgYaFMce/6/wYbU25OxVf2l2KOYxm
         t+gPr6ZSJ9DS5DJoguxYGob1F+4wp05jBUTCSx1KBdC3LMzJZpT0NBqjzu9ZJkIDEyf3
         TYAiG9G4X4+ZQhrkTaWw2DLXSA3RnPpbtxtDobFp/ysYVxJzc+5vnErN4zfvauOX49FU
         GyRN9Z7ZXdKb7JWGqKB8Z2hjP1pLgB6AJYtCmAMR49vYrVAZloFgTbwF1VVbvGueAFsn
         ZOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400879; x=1774005679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fVc/jZfynFeoSYgaf7HxtjcfzW1V4HoQrTDitcvLZw=;
        b=nMenu5FVqVw1oS3UGc1KCpLK1XnBYuFBLp2eKXZBgoL9QF4oK5rvdhrjsOg2DX+/KG
         ecb+WBNbiKc6jZAflp1upjEuCKWPtStwe3CHIW38ml7qQrW/kGYxe60mPmeD0zSDiF4Y
         2mwYv5vAZicyiynYj5IAivbwkE1H8gDhm6+xRzxmAeFLDIF4cdpQ060Y5l+g54aUIkln
         9d71HVpOFUcLSoNLTI2WcEPGlC7b+JTYquXwln8l3bD7hz+qfbHSfqFAgN/MjQaqgejZ
         GKckuscE5PajTS/Ms5/9EAZckNA9hiZYev6miolhKg8cdU0hIxZRhFdRJ1x8vxaq8+bT
         +v/A==
X-Forwarded-Encrypted: i=1; AJvYcCXJlMsnMwtqo0TVgIVcRLACZV37Z0w357LdklGN4I1d92TPQAaaoubsxceUikSl+PqSnpw8jue1QhlRLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8FmrK5GO7z0nuUpaYUwbquQAWJl0Hw6P4BbidLSe3uRmm8ARi
	KrY/oQqyWIAw/lP2vp5uiAWtT0VqedWW7Q2Prh9KpTct+Gafq5kGKkvYJmS3qK6ucBQxLzWRMAE
	IIYgUmmjrBMH350JQ2KHNRS6Qtd9qVcE=
X-Gm-Gg: ATEYQzwNqOaTocPM5N5arbye1zXsaqcjurhBYlj89pkZ7ayKZsxVIBKmeWM7FB3wqsm
	ncLgH+7KftSdKI0R1PboyWi4Qxl72YTy8QIM/DlBUjum0Xmj0PmlcLYaBg3BgE/6PbneQg5zAsJ
	eYTqIJJG1JfeslU7xV6wiRsKDbGDwOMKmzEgPgrcyLl1WIARBokVoTO3ieAIhllHqvPV6n1faNp
	3b3GrpZuTRWgSiWarD1KRYRVZw6+HYlA0L7oDjpKzzkDNgOchWBBMfd+Gm/LJrN7Nv2yc/TUaYE
	ljlG4g==
X-Received: by 2002:ac8:5946:0:b0:509:2222:4202 with SMTP id
 d75a77b69052e-50957e65448mr38456401cf.71.1773400879027; Fri, 13 Mar 2026
 04:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com> <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 16:50:59 +0530
X-Gm-Features: AaiRm51wBTKcyCiwjUblmLGy3GXdm8W7RXj8vtcE2IrwfuzlmNKUiXiuwUzU7RE
Message-ID: <CANAwSgTkyyPYExj8fwhtG1mEmKkKWqQf3ZwaJrsvj90sMf1kJQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_042120_391378_27D7017E 
X-CRM114-Status: GOOD (  10.24  )
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

Hi Iker,

On Mon, 9 Mar 2026 at 17:11, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
>
> This enables full SD card functionality including high-speed UHS modes
> for improved performance.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

Can you add the same node for k1-bananapi-f3.dts in the next version?

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
