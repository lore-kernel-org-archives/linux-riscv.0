Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42B6FEC11B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbXiQMSm1d5KIGIAmD/6YkxOZu2cbvWb1KLJtyY61LU=; b=MQFSippJ1WaiKh
	wMexauozXlpsQuS1kXxvWnuXds9KzHnESo17JL062q/Iuwn1ydbmrDz9vRTdNlFzK1JMq7RhJrbHi
	WQrg5a2cKyLU+pSJ4OxhraLNZKgiqQxieNAKCuEoZHghZjHQJ/T+gzmmGiWkMC8V3/VnXMnNsajUZ
	Yckb3o4AUHhP8xEiDUjiSRBL1hTf/+9IfOk2Z/2T4SELKgdg9EPXCpa6ocBACQa3k41jqZX+WLzij
	nCQe9v6il3nmrw3aWgjTEF2hmB8QLfuFlc8suOW0XPC1eQHsBjxnyokFhBJgeAiluGcTpKS2o9tKK
	pwWdb4fVy7wdhgWG9vtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LiB-00000003AyU-0jWI;
	Wed, 25 Mar 2026 10:43:43 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Li8-00000003Ava-1JhP
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 10:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774435368;
	bh=arsbVOQqNrFGFD4zXyvy20fOvHwbaNRzAN3h/Bf6owg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=gCg/FYiQEZn58bCOmPlpHc99N7wygx26Wav6/AQJDR2lTIN742w6Kr8i38jAy2pMr
	 wW+hiJSXp0OXRzrsxCgFAq7PAeooTC9ZF44EDWR1CDFNXIFrQC3GkbPURs+B/shDEY
	 pmvpze1MFq6b0OrJ0OugE/tPziwoLfvFtFkkoTUM=
X-QQ-mid: esmtpgz15t1774435360t08c25bdb
X-QQ-Originating-IP: 7OPY19mGtSlo4kPWwupOktdlSC4sswfnQ7F5LXLlhdE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Mar 2026 18:42:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7138833924869601224
EX-QQ-RecipientCnt: 15
Mime-Version: 1.0
Date: Wed, 25 Mar 2026 18:42:38 +0800
Message-Id: <DHBSU6889P61.4IKB55N20GPQ@linux.spacemit.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
In-Reply-To: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M9hLKyYEi/OGb0wl/8O9C54tHplv8rjOgqKYqZ8mzG+AHZA73QpSh+lT
	BmH436CA4XM2hhJNP7Qg5ISG9Q6kXg2JQSUp7a0Z3WO4DRPazLHJHV8+7elyTHhpHsQwYVL
	i9e3pvQyrTtXAOj1xOJJJ/wLn6YoghLA1newpx/yzNRlHCpqnzYtzxfqtuvTVps3NipbLzf
	P00WP7g5cazYiZAXNfwcM9WNKqLD7Slp7OQnxI+onTXXEBXhI3ZRCN66by9W2bT8V9t76wa
	JI5IvHWo+GNl76OgpJ509Q86uMAY/VuwxVkO74/pW+SrXWulDG615sfckMOs3flpxjUxUJp
	z93zKuqilmg0i6pRL61zEswPui0xw6aXbtXlgqcmS0DDCoISnPgINuYHOYLajM87yIk4MOm
	MFWjmXKMilCl6XoQ9QfviUKvS67a3/gJMp8KB+yTIujHfOHmlq18UvobIRMj46UtyOtG70W
	QUZ1LXyPUqDbg4T+9BhrIMqac2CnyY2RchsjHhO5VVh7sJsd6nFVzemM4u/zXkz0U7Vvu7w
	mDRtYs+F0hagASLOJyQOfINNcNTBIHvLTjgPdq1/3WUPA7zoMEOqATK8TFWU2YYOaAykWN4
	mKwaza/NWkAG1ME80kWvaMDLo6zNWTXbCgBRIAXo3BwjYpysneAfRD6vasccxjfGiOno8eO
	odMK8SSFBkeG9k/v996RYBiiDNlwp8BiWes4iSCMJr9KxT6Oo7Y8KenI19GKAlZpZZcekEC
	5e2YnwL0ax7ktWPYmT8HOHStgOTWwA7DI8P2iWPnUxbGNU7MObOzXK3AOP5aLzRTLynNetU
	cHb5kJxljmAdxZNxsvnoqizIt+as9JFR0Hc5zjxGtPsNPb+C1VXu5YdCusygU2W53cyhtHQ
	kUG/jCpe/g419zcUyn02gzE1oKbOrgtQ1m5zADjJh6zE+ZxBs5LSN8TTv5xYfPhZR93f2b5
	dKAg1L1322tl2r9B8JjMULDJHocEA8yzJnDFXQ8hBa4pD7fV/bOEVj4SSXNeR2RmVtG5SAl
	MRvF3FwlDHjdKBmiJNzXEJJ4YnZ0fgRC0gkdgtCk6aWFzzYzVVxzDAkwiy3TQ=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_034340_940104_25160524 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed Mar 25, 2026 at 5:49 PM CST, Yixun Lan wrote:
> Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> which use same I2C IP as K1, so make it fallback to K1 compatible.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 5896fb120501..8c04c675b25e 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-i2c
> +    oneOf:
> +      - items:
> +          - const: spacemit,k3-i2c
> +          - const: spacemit,k1-i2c
> +      - const: spacemit,k1-i2c
>  
>    reg:
>      maxItems: 1
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
