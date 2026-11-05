Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B8606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 02:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zLk8IzLS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YbuxoscO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iP19OqwwR+K3Wl0ZnhQHkeXr2SewfYxupy5zP4010aQ=; b=zLk8IzLSjldO11EoWIV9lysATL
	v52beOKyU2r+n8gIjvXHI/Rqexh/W6FdLDhoJfbZFmIeQXsJ6FBEBAysw/0g/Myl/0EXhYiJUgqHW
	zZpvDYsDaPQYMFhcuoP8qO5QDMKEOVr7aMUk+jcP0DwkakKNyuzehkIJbn+WeVs7LNXXz4oj2xC49
	znqiPEjrNH2TWPtAOal9NxFJ5/BXsr5oePcZosckKIgzJ2WI3PrMVVLbO932+ZEFjevqzUR3IrA7R
	96sv7I76fF6BN5ip0fPPrrAiXAQ/s2/pe/hXLayU3zy6JrTIR6jjZZGWm2/ROzIEoyAmVIm4Y3JB8
	o1lBpEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnaO-00000007d6c-2Jwr;
	Thu, 05 Nov 2026 02:52:20 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnaI-00000007d4L-3m2A
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 02:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793847104;
	bh=pSQlM765W4jXpSl/SCbV9elszf49mnxaxw8VUy+qP6Y=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=YbuxoscOgHThcRxXOdh5gkG3Lny9wK/JJF1vTgfTEFROLzZSJPMaaLzG2MHqyVAhr
	 imQeRgQzLBvLyMDC2av1s8+r7ucRVr6EJAHmFqBwxB1pFkadAM/dhGWDnMcWgQYP9I
	 OWT/CqlqL1zJ5QlEwanFGkyzQMzuXL2nd0r7Kdyo=
X-QQ-mid: zesmtpsz2t1793847097t2b788bd9
X-QQ-Originating-IP: BDByG9NYEZlnDz7mxM6v9n2dhLlOWgRPpDEX+pHQrWk=
Received: from localhost ( [8.218.183.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 10:51:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14892018786734316387
EX-QQ-RecipientCnt: 13
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 10:51:35 +0800
Message-Id: <DMMXQ358UWUZ.35H3HEEEUW1V8@linux.spacemit.com>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
From: "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com> <179229759512.2114.3306580489141327360.b4-reply@b4>
In-Reply-To: <179229759512.2114.3306580489141327360.b4-reply@b4>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M182XWJxg1fqJITtHxQLvebLEkcMXiMjIGfbBAk+TLCRDofSVABmYl36
	aPmcxYs2y8KTHrbh4DpiBhapUf0M693EZ5yQ3BpC1/yngov892HyLbnCrm/IveR64wu15wH
	lEsGXC66HuXIgZAw2Jr0p4HR//ajNazw2UeZQ+AmY/BydtEJtVQuQw/m23uV53lYE5VJfji
	lUftQjmFcGMy8Fw9m3JjtNbNJSwmqF8z5N1cSBqF1IWAI9hX2yBJjXMtqw6gZfSqfHzpVo5
	MK7k2BmcZcAqve79OL/udxyyzTp1a9oyG75hig83kzSUTUb+4mBns5PUfz3RxkRUdSHwUkz
	iRrJRcFUXMimPlxBtP1ioW5+u7GqiPAXEOdH/1AmC4P/i/xvf1VCCpOzU2RCvJBOb/rdQT2
	bwGYkrqIAc/xMZgYb702DXS0bzDGINvg1AOWoBWsv0RDO8gxkrfUnE62l090SXtpe8JC7CX
	dBRAA/gs99RWEC+c6MB6/Ln6S39fWRAQURcinR6UHX03Vv76Rx5wcfWWLyabfv+jRs4tqik
	KsVSIo10WW5XllOk4DWVmY+NtXsrXXIkjduyAIE6ZS6Aflho/5ionKNCztg2f/KBvPKouwp
	bAWzJO9qN+w2J7xRBrnMMYDbquo4YMv/gmYdI5nz9wEm4HcTYzBcazJMJAXnzFm5Je4b60O
	kr2Em8yZfWN0+cnIQvHvjdtBKYTE94by5lVkvIVUg4jOM37CojWCXZtJtHYNRXqaTLwBKxZ
	APAetXi864MU5ZwD+/3TZ2awTNqVlR1u5xybP1nsqipt9+ISFOdEoQLoj1xS8zuFxJJCXL+
	pGSI7HvIZ2lUAkSnkWMGbd1OQajzXUxAXbuB1MXpilDB5+0WDlzUK+kvmAzdqMAPpTk+nlP
	Z7OpbRS4mB7Lo3aPngJnly+G8C/koLudDkDhs7zCyxap0+x3VZ7PqmdAX5WhEd5yLI61Y8w
	utXHZCpwCl9nCtCiID+hwWhe11J4KJ/wGZpJgbJfVEOiZvsqlj3HLxj73
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_185215_768098_8AE0EE0E 
X-CRM114-Status: GOOD (  12.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun Oct 18, 2026 at 12:26 PM CST, Manivannan Sadhasivam wrote:
> On 2026-09-24 10:04 +0800, Encrow Thorne wrote:
>> The K1 PCIe controller and PHY are affected by the PERST signal from
>> the link partner during initialization. With some devices connected,
>> this can prevent host initialization from progressing and cause the
>> system to hang while probing the PCIe controller.
>> 
>> Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
>> this bit makes both the PCIe controller and PHY ignore the PERST
>> signal from the link partner.
>> 
>> This allows host initialization to complete without being affected by
>> the link partner's PERST state.
>> 
>> Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> index 0564c46e2f48..98f067e1ba81 100644
>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> @@ -44,6 +44,7 @@
>>  
>>  #define PCIE_CONTROL_LOGIC			0x0004
>>  #define PCIE_SOFT_RESET			BIT(0)
>> +#define PCIE_IGNORE_PERSTN			BIT(2)
>>  
>>  struct k1_pcie {
>>  	struct dw_pcie pci;
>> @@ -137,6 +138,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>>  	if (ret)
>>  		return ret;
>>  
>> +	/*
>> +	 * When set to 1, the PCIe controller and PHY ignore the PERST signal
>> +	 * from the link partner in both RC and EP modes.
>> +	 */
>
Hi Mani

> What? PERST# is an output signal to RC and input to Endpoint. PERST# is not
> controlled by the Endpoint, but only by the RC/host.
>
> - Mani

You are right; my earlier wording was misleading.

On K1, the PERST# pad input feeds back into the local controller's
internal reset input even in RC mode. Thus, the RC can reset itself
when asserting PERST# to reset the endpoint.

PCIE_IGNORE_PERSTN masks this input path without affecting the
RC's control of the external PERST# signal.

Regards,
Encrow Thorne

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
