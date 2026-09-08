Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6198EC79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf24MGP6Rt0H83LM+dfpy+GXeQwqaPkt4eDyK2dBThA=; b=fep+3xf9OsygTmTibO7/QbJ3Xa
	oXdMun5w5c1PZ/Cr+4MuWxJZDJeucKvHwRe4wy0aFE8DXTvO2dhxKpmeqij5OC1Ilv4duK1GCgYdg
	Kb+IehpKAqWvUC81BTm1fpEInjHRhfRtvt1MjB6gSqOWxfTo2MnAiTwtMGiuY3I8nMFp+Mx9qbkwj
	qMh0Uc8aB+8wHEAYRw8f7GZvglDeyeg9HYoEfoIjWEWQuY2+Q7jvxrPHE9ghsEYAfu8Ov3veeYT6v
	BFFOoWychelf+bDCvo29aZXYGSG5g9bDeVN4DjccbYoxw8alr0lfaMTvuvCHbkjkYOo4/JCAbw1Mo
	rKwIf95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wdU-00000009Frs-2sCP;
	Tue, 08 Sep 2026 14:17:20 +0000
Received: from out-126.mta0.migadu.com ([2001:41d0:1004:224b::7e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wdQ-00000009Fqg-0gQF
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 14:17:19 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AtllziWAEBylwDOWuicoRwDn5AZurYw0+Fy/xhiHsj0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877029; v=1; x=1789481829;
 b=Tz8t8nLj+OIB9JqmyuLa1vS3oBTrhaxt6P2PAJreFOoYu6Tliy+E1/xloyjhW5CtYLpocr1G
 VU03NoMwczbXQQvEWGEtnGPIb5g7QOeRlgJt1P+boVVKma+6hmj9P/sLJRseFA4jmuWJ8vtuw69
 BUuQWaZSBwq5/2w1LsugUhkg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id a34898e233871779;
	Tue, 08 Sep 2026 14:17:09 +0000
X-Mizu-Trace-ID: a34898e233871779
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Tue, 08 Sep 2026 22:16:56 +0800
Message-Id: <DL9ZZ8F7HTZT.1IUMD1ECSOZXL@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Troy
 Mitchell" <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Thinh Nguyen"
 <Thinh.Nguyen@synopsys.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
In-Reply-To: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_071716_348529_6885D5F9 
X-CRM114-Status: GOOD (  30.32  )
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
Content-Type: multipart/mixed; boundary="===============8429958156058613700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8429958156058613700==
Content-Type: multipart/signed;
 boundary=a7ff6faabc94381f35eb70cb994205d1a66fcd018b82abba28681d1ee3fa;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--a7ff6faabc94381f35eb70cb994205d1a66fcd018b82abba28681d1ee3fa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 8, 2026 at 10:01 PM +08, Junzhong Pan wrote:
> USB controller runtime suspend halts the controller on disconnection.
> It relies on platforms with custom connection notification to start
> the controller again.
>
> The host branch of dwc3_runtime_resume() does nothing currently. There
> are two paths that can trigger a runtime resume of the dwc3 core in
> host mode:
>
> (a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
>     A platform wakeup IRQ fires and the glue handler calls
>     pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
>     the dwc3 parent first, then resumes xHCI. Both wake correctly.
>
> (b) Wake lands on the dwc3 parent (ACPI platforms)
>     When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
>     parent device -- for example via a Generic Event Device on a
>     hardware-reduced platform where dwc3 is enumerated as an ACPI
>     device without a glue driver -- the ACPI core turns this into
>     pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
>     downward, so the xHCI child stays suspended. Root hub polling is
>     never re-armed, and a device plugged in while suspended is silently
>     dropped.
>
> This patch fills in the host branch to cover case (b) by requesting an
> async resume of the xHCI child so xhci_resume() can restore the port
> state machine and re-arm root hub polling. Glue drivers in case (a)
> resume xHCI directly, an extra call introduced by this change, but
> runtime PM can serialize those requests and skip device already active,
> so the extra resume call is safe. Those calls can be replaced with
> resume calls to dwc3 device later.
>
> Tested on SpacemiT K3 Pico-ITX, covering both wakeup paths: an ACPI
> boot with a GED device notifying the dwc3 node (HID 808622B7), and a
> DT boot with a modified dwc3-generic-plat driver exposing a wakeup IRQ
> similar to dwc3-qcom.c and dwc3-imx8mp.c. This is not validation on
> actual Qualcomm or i.MX8MP hardware, changing those drivers would still
> need platform-specific testing.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Assisted-by: Opencode:claude-opus-5
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
> Changes since RFC:
> - add Assisted-By tag and collect tag
> - refine the commit message and comments as suggested
>
> Link to RFC: https://lore.kernel.org/linux-usb/20260811090817.109350-1-pa=
njunzhong@linux.spacemit.com/
> ---
>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c59..76883dc6184c 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2739,6 +2739,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
>  		}
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> +		/*
> +		 * Only the xHCI child's resume re-arms root hub polling, which
> +		 * is what rediscovers a device plugged in while suspended.
> +		 * Runtime PM doesn't resume children, so request it here.
> +		 * Keep it asynchronous to avoid waiting for the parent's resume
> +		 * callback to finish from inside it. Glue drivers may also
> +		 * resume xHCI directly, but runtime PM will serialize those
> +		 * requests and skips an already-active device.
> +		 */
> +		if (dwc->xhci)
> +			pm_request_resume(&dwc->xhci->dev);
> +		break;
Could we also check a parent-only resume with no USB wake event? For
example, reading the DWC3 debugfs lsp_dump file calls
pm_runtime_resume_and_get(dwc->dev). With both devices suspended, this
change would wake xHCI too.

Would both devices return to autosuspend after the read and still
detect a subsequent plug-in? This would help cover the non-wakeup
case.
>  	default:
>  		/* do nothing */
>  		break;
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260908-resume-xhci-0fa34ff9b332
>
> Best regards,


--=20
Troy Mitchell


--a7ff6faabc94381f35eb70cb994205d1a66fcd018b82abba28681d1ee3fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqAY2CEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC93lQEAnfUXUqFGj8nw
pq/QcoMwv8/AZglrFri8AwmbKiziyQ0BALR07IvfqVq06ZjfzBNg2XwB0u4Kf28m
MbT8XWa53wIE
=yhFf
-----END PGP SIGNATURE-----

--a7ff6faabc94381f35eb70cb994205d1a66fcd018b82abba28681d1ee3fa--


--===============8429958156058613700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8429958156058613700==--

