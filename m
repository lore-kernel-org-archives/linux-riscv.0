Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC4CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 07:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Pr3gm8Aq83HSLRmdNoStkWCH2gNP1DmOZPcJFb//Z8=; b=WMGo3fXd5NlxOl
	yUcFQ4yDJBRTr3BRvV4eGQQgoTYAjmqrkAWHVc/xkegTO/1atjTRczYX7VcP45bXksBzXaxa8LWaR
	kafxUSYCwiKccWC1yIoRQqIH7tmX+HcidSboAa0HelGfQPYxOCqDQHLi77+ywtVLgMEh/3ShSqBhA
	lJWnhE+tA65yi6Mm1PgIId6JxuJF0DpQ7DrNrNqGLrKchwJCcbLVVGtKqk6PWvWyXW7psAgfPpCxx
	vuWrT8WA10XJyv2hJMY290/F00OXpyWi1nh4kfY23249OODn07XOZlHBBznf20+mnDUSuKL0IF642
	GeTO0bqPcl8I03Z/Ty6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFsF-00000005tle-03he;
	Fri, 08 May 2026 07:43:51 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFsD-00000005tkL-0kdr
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 07:43:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-67b7c77865dso2661580a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 00:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778226227; cv=none;
        d=google.com; s=arc-20240605;
        b=EBib8Zue73+vJ27PwWjvzYB6yCxfpx6HEEtbEO3KR2Y5OU+JuQwkoSKtvZKDawK4MI
         1uDc5a57kT0Nn4wpQUy0EZ1PlTpL89X7Lt3BVPiIx4QzDeoNBJP+y1Wet+wyC4sNvtnJ
         a6DTKuxPw5CHLz7EjSA347n+Bs1ezN7iLTariQhqXgYdNOirZ63nYvITTdX+yYnsSiVS
         YsgsW0npAgjL1SYz796ue+Q38VtnP2JQdn/wygtg22fZ/3b7HGdfq8Eo6OUk88EV8KUh
         mKSxjPUuUtOTUBwlFoIvZ8ZanjqD63QIlSiGu13deWNUflhZ/0zH3muoWfXwBAGHKx0g
         vmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        fh=q6YyCt3XyPnPH1hCkN5mh9j6j+4msxjIM34EJ6P9Tu8=;
        b=QCUWjLILqLYv7g+7ls+i8cJ6aHqcEyRx5+rbwJh23Sw9/u/Elbqw0WdO9J7zIWbo3s
         I2X+y3kPRPCkBGFMB6YSJkA/eTRJknlthEmYZdUC+oiFTXKnNVKsadCdurz0HALn9jQ1
         0oW4oSTxQAUq8l67DlCZfpsOlDQOVBsUbeFggRSxvGM/I4F0fBznwmUgQGsbKYuzvGa+
         6eVPxVDWeIiz2y2kW483HHftP10oDROBm7v22JDLfu63Vw82hAh46JR4oBcD9rnNiZ0p
         uJgRmnkLnToguIMa8B8wC7I3NXRHGF4QBbBXNM9aljb6WNkwmJ3VJpbEZ48ZFl0IBFAQ
         O8GA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778226227; x=1778831027; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        b=dz5+S9u3AfsiqwpmU+1bMg0bHnzb7Xqc6SN5ww8a5auJSHhqJ/MiaII1OoAEdrCqeM
         N5+dDXs0hTuuv3Ju9Ig7s0ID2QaHhPw1Jy6+3tWrxfhinHIXRlf+ydgp+pQWsRZzs6LQ
         Fa3QAtQhT+gM6Z2B4VXKBLd3RpYYuKlEa01iKGoqr1PDAKaEzhpFORP1XbCFwJlLHDbF
         xBHKMcFlRFTpGoAjn/ObTG60N2cWngFTo5bp9L7pjG4sLa4v1/4XNRgl/AxtrdP9p8dt
         CpHu0SgbMa+td5friZGOKAStxfRLKwlHIkqEJkIXJMCglcB2VEhRUj45SCHtn5HXMTqi
         xWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226227; x=1778831027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        b=Suc89WwG1+EVfMhGNcozrMwqbpnA7Yh6LYTYJzmwu5YPXfaQiobYtPX4cAxZ0UxJYz
         +7hV2SStVVdWvTLSrRxGneLoohidsvZnKoyrD02m7w7Pr9jC68C4QvxCPG3nCv3qvynr
         RmqDYXcEOJHYAwwg1QySAbwwSdPCEiaG0pAHqvJ7pebmNz6V8QYjozLJGndbyTek5zI4
         zhW/59QAadq+RaXhY3CLNx/12Mt2EomVwvnGjvMcuIaNgREuOGW3I0NYfBICBqod4ywp
         aqIMtVPirfPNqHQ9vlNAbbSIjLmqFHXSk0YD92VDh9MydeTieyJd/2fupxm5BL+Zu2Z6
         0zjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fzY46oKZ+oGF4gAAImEEy5QPvLnhIwI3cFcR7WoGVviyAorqk8HbQ4/CI3LGeOsxho9n97z1nPX9tNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxXv1eLVv0ienvQ1kyi7ndOUA7aInC6yNT148mkXLBpXazRyDS
	7q8A7pbcAlKf4JkozJnQbkk3lPwpldlbHHr8mKJ8ypMo7rvS+H0NmHtjTAeF0FeUcKqquFatZrC
	tvAJWPTIWaKWw0Uadd6Jbu9BmGXA/95Q=
X-Gm-Gg: Acq92OGRc3E9/TYxAj96zbi3aCo6GIUQVgBGZ3WQbR4r+QST0TmLKEBlBrK2wHp+Ffk
	d1/Swv2umknyx/Zv9NUno03f1H7hzyPWE/LTRn+9DM195+2LnoTLNYbcXMsimPSb04VOOEjd4vq
	oYDYCVFq1oVqHq/n/XRf5Q9bakfEZNpfvvJwSaIhWS3VUdV4S86FRWcl8iFW8b2mtfnZAmrFO2g
	XuGG7zY8KQKpmZEjpwZjO3ZTMRPKFDP8oy+MizmYRSo6gZLEZ7mXLksdE//xVQQf5lSCIPWiZ8H
	f0HF
X-Received: by 2002:a05:6402:3137:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-67d642c320fmr4048316a12.14.1778226226925; Fri, 08 May 2026
 00:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-5-linux.amoon@gmail.com>
In-Reply-To: <20260502051906.8160-5-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:13:29 +0530
X-Gm-Features: AVHnY4JlnCRZnKTvTMdYqQJwi8x36a1HcWfn2B5BacrqHqsRYonr5CXEMpLcf3o
Message-ID: <CANAwSgREs-Ai5RxuiD4Ue-8OGGdrhnLSBmSePBrjN3x9=59zrA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vin-supply for PCIe 3.3V regulator
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, 
	Chukun Pan <amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_004349_237871_FF404C7A 
X-CRM114-Status: GOOD (  17.47  )
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

Hi All,

On Sat, 2 May 2026 at 10:49, Anand Moon <linux.amoon@gmail.com> wrote:
>
> The PCIe 3.3V fixed regulator node (pcie_vcc_3v3) lacked a parent
> supply reference. Wire it to the 5V system rail (reg_vcc5v0_sys)
> via the vin-supply property to reflect the actual board power tree.
> This ensures correct regulator hierarchy in DTS and allows drivers
> to resolve supply dependencies cleanly during probe.
>
Plese check power tree page 4

USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source

USBVBUS is power source from the typec port.

Thanks
-Anand

> Cc: Han Gao <gaohan@iscas.ac.cn>
> Cc: Ze Huang <huang.ze@linux.dev>
> Cc: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: new patch in this series.
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3dbdf53b6d8e..6c06480ba100 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
>                 regulator-always-on;
> +               vin-supply = <&reg_vcc5v0_sys>;
>         };
>
>         reg_dc_in: regulator-dc-in-12v {
> --
> 2.50.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
