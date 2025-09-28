Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE0FCAC5B0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsxhQg7K1SnNkTc27rZ4iKj2OWdq6ci1pCdEcr2o3uo=; b=WSnOgDXkPMbnyo
	5GDSvvARuOXdZ5CHgTrFkYCFsTYfFsUnRchl1dZs0egawXb/VthtGauDKXZhRZcMN4QPt8mgyVaEw
	7+aCRkIsyGUdL+RRr1M3erz9QAe25wGw4WMK2nVibCJPla/ThimpkCqZd6P/7bKVjkNcSiHOfVLAQ
	pg3LZir1RY3rcxTt4uHEKjemr71F8vaTvyEoMZpBAyrODJxKT5G+qytd46U69BG8A66hPxoBy5mA4
	wpad2RPI88SssW0TEmSi8LAusOqiheOKQQRELDD8Txf6/Z+qUjabdXFPW8yIS7Pm3go6FEvKkZgJ3
	Z8Rc6Fs658SzDFoTWdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gne-0000000DGqj-2NtY;
	Sun, 28 Sep 2025 02:06:06 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gnb-0000000DGpV-0MQ1
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 02:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759025079;
	bh=m9Kk7QA8lWfdkzkFV5B/KM9BWqdwJsdsHEE8+TGRrrM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=XwNUjyHVA5k32M95YQy28JjhMeaiz+GPu5bSxH6+lgtKwbvte3D2mUezhprlpXDd6
	 6DjfWyoxKA8sI64pKNTzLWGiD12+94LDll+/a7bUbvxnhmsey3+H3hK9kuD9IhZf8y
	 XHTT0vqjmPqsyQU9Bp3byH6tVyQxXVQ0lYquP3VY=
X-QQ-mid: esmtpsz20t1759025076t46662b3f
X-QQ-Originating-IP: lQaZvluawJANmPALLJ4FldAi7OUDYe5AwRXmjd29L0E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 10:04:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14352669615158593729
EX-QQ-RecipientCnt: 14
Date: Sun, 28 Sep 2025 10:04:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <20B16B97E8F735FE+aNiXswZes4EM2abP@kernel.org>
References: <20250926175833.3048516-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926175833.3048516-1-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Np+AlqyfvJHVjdiv9C0AC+qoI1zC1eunAQA7z2Op1WX2Pl2k2Q5I9lJt
	Zl87eI//T6L2ScBJVj4E9hokwiwY7DxUOD9DoOLqpDG1DRWdYt/tH8VWtgSwYccZ3YOcMIf
	injPQe1AzZ7zSV8YWEJ3Qs6EAoAEZXIknSEUohk+8oru2B994inkL97ln58Xcw5X6nQ3946
	T7qX2eeSpYeTFjnvdbTkuTWEsBFNd9dk8CDkL3XlAebeAaguBHfZ4/f+ij8EkaQ86APtGiQ
	PaNcBNSCl47kGbIFygHmNo/HUTLTd/QqJ/SinTTl9p17WvV17YZkY+6N3xZLWB56x4pn88J
	3DZkRdb8cVZVvgyB4A7j4TPTnlVfFmU/Vv9BkM41/ASAuGZajSeQuMuE+eGRyRHeCE5Bt6o
	OtShy8u8P3+u0E7iufjcW94ZSWSFwpxj6JNK29ZLNDDtRCviccKAVoo+m4BuzlPCO5djZ/E
	uEpXl//XbwfHVJtDw8WkZB+bQqhxUrTjloq5gArHUHYEDbAVKXl/Ris0GZyggxotBmWfWZl
	ZDBi2lmLSssTNY1RnHs1uZHocV3B0qbXWZ+D+oSxOYpe2w4SmgU7ahg88dHxqH/Of9wIHVI
	0IaIMeefWsVuAehLJndLLR4z+7J6v2d1AO7tpaSatj9nhTdlgPz/t9WCMWZ+Sar6TK5aEbj
	kr/zcg+iiMMa4e1brQaGczhjJ0FUv6aDg4UHoHYeqgS+0Pe3bF27WfKdq35Zj1pScJQ1+xZ
	mTP8DraNgoATtN+BO78h0aFV6VW7DqpuCRlvFLX7Dm/zYv+JOdrszfpeAsSF7KbnruZsZUS
	2ojY5Xg+Gl4sRcDDDEVT1Mw8OhLVh7V+UQhVN/8ZOGZN3gqsiM5eHJcmPGN3N8RiCDF23FP
	WJnMf/NEPsoUz9AeH7f7G4E8KH//dQWp/mows1eP/18Fq3Uj3L7q24HDI26XrlGOSQiE+/X
	Sv9+ftOsOHIkHx6Z+Q+iiYYsSb+AIRFiH/Wbq0sTXKXOlHPaJZQTKN1C+9UWxkbY8CRUqlN
	3xzHA3+e5oSO/KwDgZpZfGYIHtTqaL3ocSGwWtIT2u6iOsFXfvToLgls+LvuicuzAwxclNg
	ndyhijiibV4
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_190603_488902_0D4AAD16 
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

On Fri, Sep 26, 2025 at 07:54:36PM +0200, Aurelien Jarno wrote:
> The BPI-F3 board has a 24c02 eeprom connected to the i2c bus #2. It
> holds board data. This patchset adds support for it.
> 
> Changes between version 2 and version 3:
>   
> - Revert the name change for i2c2-0-cfg and i2c2-0-pins, the second cell
>   is not a function number, but an index.
> 
> Here is version 2 of this series:
>   https://lore.kernel.org/lkml/20250923205028.2355244-1-aurelien@aurel32.net/  
> 
> Changes between version 1 and version 2:
>  - Rename i2c2-0-cfg and i2c2-0-pins into i2c2-4-cfg and i2c2-4-pins to match
>    the naming convention encoding the function number in the second cell.
>  - Rename the 24c02 supply name label to buck3_1v8
>  - Add a onie,tlv-layout nvmem layout describing the content of the 24c02 eeprom
> 
> Here is version 1 of this series:
>   https://lore.kernel.org/lkml/20250921210237.943370-1-aurelien@aurel32.net/
> 
> 
> Aurelien Jarno (3):
>   riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
>   riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
>   riscv: dts: spacemit: add i2c aliases on BPI-F3
> 
>  .../boot/dts/spacemit/k1-bananapi-f3.dts      | 33 ++++++++++++++++++-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 13 ++++++++
>  3 files changed, 52 insertions(+), 1 deletion(-)
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
