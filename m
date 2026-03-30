Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C210D14AA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYks/qJd2hdKF9dEdqG0OMuGYAsx92NwZVB/PArB5Bo=; b=RvGENBJuoZLyZb
	19mFM0s1YcSl7HS5GfKU41M8Y0Jzj/Su+3kfbvV6nRbX1vMXUVBs81AucvbvqyqeeVTkUru9haKNH
	zjzpq/4vGNCRfpLZOHsBRKNHzoKR39u0Xt884Stj8fdsCOzT13AXPpK2joPHJHgDMYbBZVw8z2634
	jpdaCBEMz0CNvQcjkV+mdai0jzzLNHI73IH4ptYfED4I5IRcwTAxioaQ3oto++UVeNIed6LggubxE
	I0JHTQhbk6WjF9ILxZlgGsbB0U5jDSMWNaCXFXz4WkJnCTBz4SOxTVEYqlfGlmkxWraYFXzFL0glL
	XDsxolKAa4rUzyvmi7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BXR-0000000BEKZ-1V8k;
	Mon, 30 Mar 2026 12:16:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BXO-0000000BEIE-37Ht
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 12:16:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso2173359a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 05:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774872968; cv=none;
        d=google.com; s=arc-20240605;
        b=eajHR6cjpQY0Af713ASCLSatu1SguBdSN62WfwlorVfAkVGhC6eEt6p72dl/ypH1G6
         +jfld54MuAIXyc1MZnY/jDa1VjgPUe3FzRthGgUELa3GYivDw5hm+SDAd6QBxFAmWO63
         JsArg2Xh14IpMS9j71Mtl4CLfBFaJlxpDhkcDUJGgNVuXxf8b3pErUafgneBbFAm1BfB
         ER0Kgn/8aQAWgDXADWFEekodq2botibwMMQ0BHNZIdPyqo9p4IXvM/BjPiS0oxL8D9Sn
         MQ1pJD4fEpIoSinJw5/7RPuZVb54525cyNooMfPwXHWYBqyBY6qT2YQU+e+d0PX1CbsW
         ejzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        fh=a9bn5Ay+TGiXkM4AjDKFFuz784v0DSui/5CuZS6Gh+8=;
        b=VS8UQkmG+24RpbOGFghghPT0/Z+xmguRs1gWFVt+wDfyhHENoOnGe6z/n3Cw9l/LmG
         DC4gEEuld6yTOTFkV8/E94xO1/dd2CTbt111sW/sGWvZ3pp4EBgwqDVZXsqMDM+B+uNd
         FFQIInpUgaWsXZuORDFq0DEVMWi6Jw3nQAwdL0jRyQHl/cP2nIsiddtM/Ee/C7KwgxF2
         MaoMREPKMi50WUhsYMUc1C/cLIo1iBkFwTBYLEeY/XuBfKPwOihnFVCbrjT7HClfI6GJ
         dE++VNqrM8un6yEYUhV6fmc1zxCcGBzvuabFHXiWocna8TbNT2U+tsazzbehPUB43qb3
         1MUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774872968; x=1775477768; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        b=SWhK9bI6tkYj86ZDzl6aW94g8YgwlLX9YUrymw0n549kWdSVFdm5b/2/SXTV9jq0cC
         pSyWb/EJZxU400YOTsw+pocdW9uTaW1OK4TgqDn0vMgdNiR6fBivTg1h4pSYRvS0AlpB
         qltpFEp+pFvbtgfBQRzIe49rthS8B9BFEUtvUtBqWgy6pMilLdODHiZZwL/qWa77ofCV
         /7vZGfxN3BRcFexIN0Kogl3ijpymitLs1vfXIeX/Vt/zegeGEqb24dfJ1oask3eJGdID
         eUAIHa/yG+M3ncD7IyufdnWAe+DsqqHMA3r6g4FNtpUxmtpFLE4s3pTQAvCenYbutNv2
         34wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872968; x=1775477768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw35mKRYCMJg9FLMVpCEhFv3Apj6vxn4xy9VKcxb9Ow=;
        b=fwGP2UCvC7slYV+PGp+/AH1rcPsd/ncnOlKJKqcVplj/LbxKEPpXzEknrQYDLJC+uP
         vRWhT6ALiWZ4eRGN+MVKISf4wEMfWLCQEyckM5b3B+jZIFkvekyM3fJ1+ZkR61VOsZsO
         8J/ynTfnl0fVrCjlev6kp7DOhywRTf5q5z8GdJu9JrHmjQfCLJbMxmL7ESvGqMoP9i++
         jFSBE8+vGuK2bCx85ddfk7oDau9r08uk1BjJMqYOYj27kaeNnDDN3FnVbH1ZELsPBvrS
         JDo1+Qbx6FP39uTqMKvvnB3X7sz/1Ofw/CdH8YXBLPcgIcsTs9bGaimVPBAi3/z/4Vd6
         8abA==
X-Forwarded-Encrypted: i=1; AJvYcCWA4TtTWpLz99/BDtagjJMHN2zUHdqjpgRaTHf3zsLF+lSATJu2skC0yM4mjDe494xVheAalj/ZPPL04A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEDck9xUfwSxFYBQovK8bKtS/tRgk7siSH2rCPCXw3FcN6h8Z1
	CGjnYgru+rDHhTn8/wyI6XPmv963dJ7BrVQ5WfLskWxvobJq0mtWW9Vluy0LxA6oT4gGVnNAHmP
	7YqKvKbYlo5eXenb96H+Vs2VhGOpXRSTasu1z
X-Gm-Gg: ATEYQzwyNrOTPzvXdX42K9RCt1ucs8D6+95FnadIMpd2+yFAkDHKehRPWLXyz2ZzY1e
	Do+iHVxW0L4BM9XsEWlQ96frLq8RnZIqTDLl2MVt6BpWejF8d4StbhvlYBpygRXIR7alZ4gCWKl
	4Itn4Vru4sYSKzVRi3hBoQPOND+gB8kc5p01P7BSonXaCeVaYPcOzN7Xk8HUn3pOtxtMlY4f5IC
	7gDhRLkgy0DIPgktJvU5mTe8VK9ZGXaOZ9l5iiyvRUaQ0QWrGRgEWjxyB0FCZU7djVjfpqhVdKp
	S3Xd/g==
X-Received: by 2002:a05:6402:280d:b0:66c:167a:30c2 with SMTP id
 4fb4d7f45d1cf-66c167a31f2mr564738a12.8.1774872968093; Mon, 30 Mar 2026
 05:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn> <20260326100010.3588454-2-amadeus@jmu.edu.cn>
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 30 Mar 2026 17:45:51 +0530
X-Gm-Features: AQROBzB-LqUMsU7GjSBa2raN-d9hzLimLXCwAQc0Z2nOV4SZWTpS5pDRv4Qty3w
Message-ID: <CANAwSgRO+mXtc09D=iVb1kvMHpkdekiwErRXZGoLYrwNtMSZqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Yixun Lan <dlan@kernel.org>, 
	Ze Huang <huang.ze@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_051610_793865_EE3B3641 
X-CRM114-Status: GOOD (  10.45  )
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

hi Chukun,

On Thu, 26 Mar 2026 at 15:32, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
>
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
