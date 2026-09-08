Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AA5C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GD5iYQD5GVCazWsYQuRgYCDu4VcDx0P/Wo2x+p7e0t8=; b=FlWCwb4BMPUo3j
	GI3dfZ9u65hDf+Jnj3pqKkjN06T35UKLhMvTJmVF/88t2u04QtMrxBzun149Mnww/85UN7nk6+HqQ
	0VsVkeiEgaePZ4C1BqOAODXMkgBJ6IT5nZU4REQ8GeSdZEVG8r/E+mlkAESvOTNVtMAxLgM5XNdQy
	Btri/L6TaIeC2LpIgDqPiYjbWrrP9lsE+aqbDwlf+rmLFUUDcH+Jxj1o0Lp7pUMOIsPP18+K4RZO1
	tUs2ac4zB24X2IqU4nfy/sWOTg+n2BC702FaNKXhVekgFzlM9/7I83u9+O1y9LZePmAullcToNxs+
	Qpkau7lHfn5LQSYWOwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wOw-00000009DgE-027f;
	Tue, 08 Sep 2026 14:02:18 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wOs-00000009Den-3eYA
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 14:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788876098;
	bh=7LGo2OQ7yhwaHNuhcrdYROzYNe6ldJsLGDujKMNtqX4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=O4lkqtsFvyJp9DLNxlJY70i9Ff6oCMmJmWO1ujAt/dkY4SNIC2LjOmeQ5U+mkx9Rn
	 WyjFYJnirxj4Y/Smtp6cKzSXpXSev+vibsG4+B19bYPuALWByocm+P4oBiwTnTc4e4
	 IbVLyfKSkcPyYTnYV5jwaeCh4Fo/LLEprnBTw7tk=
X-QQ-mid: esmtpsz16t1788876093t830e6267
X-QQ-Originating-IP: TXCl4lwqu38gDlsMHp3gXdusF0fFEpvpfPPyidqgCjw=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 22:01:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4229499913339683584
EX-QQ-RecipientCnt: 8
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 22:01:20 +0800
Subject: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume in
 host mode
MIME-Version: 1.0
Message-Id: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAC8VoGoC/x3MQQqAIBBA0avErBNMI7KrRAuzMWeRhZII4t2Tl
 m/xf4GIgTDC0hUImCjS7RuGvgPjtD+R0dEMgouJKz6zgPG9kGVniHGr5Wit2qUU0IonoKX831Z
 IArZaPywgqxhhAAAA
X-Change-ID: 20260908-resume-xhci-0fa34ff9b332
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876092; l=3482;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=pMSN8Aa6SA//FJWOWSAwmKzpRwkXWyJEfgwCETNLt/A=;
 b=TjYm4zrYsOmLRXr3kGWuVs5PgsRI7x00Nys61ULIxgVQVzPs3DOJJL/r09tYIwaB7iCDDN4ds
 hH41StJeNxVB516z28V1clYWHpnd+nH1Z6k7tUTyPzGzRwBB7w8VCPh
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Od5ZbCMDTYwa7n7DsJaT5UDKfx7jqPeJcQy7a35xtycoTfHT9y+uoSRl
	zZgLdpiUtwvU44YOeYkJjLPE0e5hCYSI3/N4LNyHBXMrG/jYO9ltxnTgfPPr6TmYEOileMo
	ujCQnErMze79dQLClbBj5PmM0QZ0D1q9qWVnOnDm8xrDwH7VYWtKIAj3JrewBq55ed7v+qs
	PdQGBcn+epDEVakL7hm3AM8qNdnR3lvWAbrV0Gz43qI306Ofv8SwDa3kf0E7dsfXhircgmc
	YjnX8rDoR8O/bEYxW7GK8o3kFvgUjRGgMuJXVq5rSo5+888iy1Zvxa2hiM7JJEzo/IsgFwX
	/iuxSWdakNRpPQn4JnDByUR91HH9qQXMgTvfGtOepVqCoorxU2l48dIyUXmRblpcd49zi/W
	GzxYsZWz39HxfkWS4FMMRtf1siSuPWWJXijdAuFFpzRRhtBoAsUj1Qh4LWPT5NXhekGhbz/
	MXAwZ2p9VEcKTKeiGeCACOTrLrrdESwUxaICU8RWtsEfQ49EmHf7s64E4KBxtfv+j9Arv1b
	vVwWuQkLCWPJ+bVltIv75ytUkPGRSmoT0QVAe2U7aEqi19963CZq3zOrFXwDZ7CXnWfw8t9
	LQyj3pP/cjQSbppaEOw/X93EpSJrq+znj59QNBTQlzvYldGR0Mzo4txl0mvfmSYVmfhRN82
	FpzPiZtKYL475f9sdEBGyrf/cN5X2JFIDr/uierD/Si+DBMQsP29YWufdnK2rLSSQxKnEaO
	zyCiMoQvAAdD5T90TTUiiJO9InjchrDvsC8/3YlwLRtcvGblRuv7kRneKx+x9/cU4fI0RFo
	Q9+zpTtJEGDUOY5BxzrYGerPTMpWhbG/pYQWADKPYnIQiz0SuftbLsn0hYvSQH7uFhm5y+t
	Xtk6eBTCubySRx+p3cQ1Is9JZk9UKI5czVFKdIcDcdu/U3G/0sHa3ULA+j6aSa9aKdiVDiE
	QmEZ30tImHpv6UDpRVYMSd9aqoorEWsCocOPaW7iv1KXfHCypFxR13Ul4IJFRhisQ6iInD6
	DL3c0ftVa3TfLX7YKt5GEXo2xPQjTntvbWmb9sfzGISphdF4vTjQkOJy1g3Gm/Rwx0Snozr
	GH/1DpIfMBaThTJXdmeSWYSi3+BsrdKOQi/IPkDghUEiJLt/HiadnftR1ocQB4/SKeLho+N
	2rgsA/+pRDUP/RsjJrkI/oqm+g0h2nA90RQ7
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_070215_690499_55E483A4 
X-CRM114-Status: GOOD (  15.74  )
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

USB controller runtime suspend halts the controller on disconnection.
It relies on platforms with custom connection notification to start
the controller again.

The host branch of dwc3_runtime_resume() does nothing currently. There
are two paths that can trigger a runtime resume of the dwc3 core in
host mode:

(a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
    A platform wakeup IRQ fires and the glue handler calls
    pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
    the dwc3 parent first, then resumes xHCI. Both wake correctly.

(b) Wake lands on the dwc3 parent (ACPI platforms)
    When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
    parent device -- for example via a Generic Event Device on a
    hardware-reduced platform where dwc3 is enumerated as an ACPI
    device without a glue driver -- the ACPI core turns this into
    pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
    downward, so the xHCI child stays suspended. Root hub polling is
    never re-armed, and a device plugged in while suspended is silently
    dropped.

This patch fills in the host branch to cover case (b) by requesting an
async resume of the xHCI child so xhci_resume() can restore the port
state machine and re-arm root hub polling. Glue drivers in case (a)
resume xHCI directly, an extra call introduced by this change, but
runtime PM can serialize those requests and skip device already active,
so the extra resume call is safe. Those calls can be replaced with
resume calls to dwc3 device later.

Tested on SpacemiT K3 Pico-ITX, covering both wakeup paths: an ACPI
boot with a GED device notifying the dwc3 node (HID 808622B7), and a
DT boot with a modified dwc3-generic-plat driver exposing a wakeup IRQ
similar to dwc3-qcom.c and dwc3-imx8mp.c. This is not validation on
actual Qualcomm or i.MX8MP hardware, changing those drivers would still
need platform-specific testing.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Assisted-by: Opencode:claude-opus-5
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
Changes since RFC:
- add Assisted-By tag and collect tag
- refine the commit message and comments as suggested

Link to RFC: https://lore.kernel.org/linux-usb/20260811090817.109350-1-panjunzhong@linux.spacemit.com/
---
 drivers/usb/dwc3/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..76883dc6184c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2739,6 +2739,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
 		}
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
+		/*
+		 * Only the xHCI child's resume re-arms root hub polling, which
+		 * is what rediscovers a device plugged in while suspended.
+		 * Runtime PM doesn't resume children, so request it here.
+		 * Keep it asynchronous to avoid waiting for the parent's resume
+		 * callback to finish from inside it. Glue drivers may also
+		 * resume xHCI directly, but runtime PM will serialize those
+		 * requests and skips an already-active device.
+		 */
+		if (dwc->xhci)
+			pm_request_resume(&dwc->xhci->dev);
+		break;
 	default:
 		/* do nothing */
 		break;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260908-resume-xhci-0fa34ff9b332

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
