Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE0C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93TdIt9wugNdVNdft5kgd91er1XcPpyjDY0QiaoCNRs=; b=t5ZvDdkMZFAv1A
	OFj0eTQYtyXWFgbzKjfaB5QacqMGlpt3heFhj0xD+2AIdicGf5S2uX0pKFLOovrucxYOCktOpJy0f
	BOISzGQnp15UrURfEGHeMch/71Z4uZzC1s6CZ0fLRpXU2jWOAzv3v5lrgwTe2UP7W2rSSmuhrPiQ1
	xzZfeXsq3dx0JFmaop3dkdNU7cxL48W1eP68EjDw5JrEpXCxs6473HpVmvfSxflMVk3dlrYAYYDeU
	+rlgmHspnso0N3hVQFl2Bf81KGSw9Tx1Hh2RBucFqyOmbyiELf9KTbl3woHT2V4JspvQCQMYg3g7E
	TI96Z0XjgyaohGolImmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0P-0000000F7S8-42Aw;
	Tue, 05 Mar 2024 20:03:17 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0M-0000000F7Qn-3wTX
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 20:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709668992; bh=s7QEg+O5WzM5yI1q1lQPoUf0e90dpB5qxk5MpOdViLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=INun/ZIMt4TbGyjUGH5JwtD3DeZwaxXE8riAbVub+EfcMaJFpSO0HhwXVAHPN7nA8
	 CqUj4Eq6/Hu0yq9C8kLPJ4GRy4FvmzHi0VTLoUXOya05svQWyXNNKWBYJp0ep7fsWn
	 GRTR4a9tEoBegdbsEmJOIvShC5OAV06Ale6KA93Y=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C898283; Wed, 06 Mar 2024 04:03:08 +0800
X-QQ-mid: xmsmtpt1709668988t2czpc9x1
Message-ID: <tencent_29708962B242A61B23F9460425B4951CDF09@qq.com>
X-QQ-XMAILINFO: MIAHdi1iQo+zH+lNGdhvPFsxOATruXiZIjA82Lx9SPNbe0K6xjb+VRmvJ7tiyR
	 UIiZzob6Q1mg5XKOX40FF7iwJnrEoQf/NlifMgAuZeV5CoHGwPxo2l3/skO2F8eyNm3Ti0O1D1VO
	 1ZpwluVwM80a7lA0LOOo4KvbzucJ+DfBucVjfCH7UbR/ttdCXESxsJY0PHi2Qn180wqotZb1iybe
	 qg+o9zdFVOMW/sPGdHLCSnsbKXeZ6reQR1qhgLS9i956kS4MqPXepZgReevnO3Jg44F60pRrZdNx
	 MNKmf/XAl5XUX7pRMq4qILf9ciKgRDHQ6WnrhisdUOcc0D6V/vYXv/L0FgYkSF7PwGainAeYehn+
	 UIChaKoQxltw6jvzjJmuZULRCD1y3LbzrpasUKzpyyi9F7jfdk0mBygXPmkeAnXgTirBsV1tebll
	 dyuAiNKkHMkPsURAhs2PLGfqJvMMqxvWOn4Qt9EY/bAX7qi7xzlAyHA9GECywNj5R4RxE81KzvwD
	 Evd2zFiJZdbnFgMtBeZ1JzH6b3Q9fk5cOHz/VUDEsgVpa3EvRTDdie9kVBXCADECEji7EArd+e5Z
	 TPG7j3Fprh6woLkm42OvlPtRJBSbIUSZcUk2j81MEtJTqjPQizTbMDyHo2OHmQmRhJ/Ps/IHDZ8H
	 JVTxsT+JSnQDRErSMRJPIkKxyrJzU/EyXKYkK2Le3L2KdCXRV24BGkrZUxrYOafRLGeL9p+R/A1s
	 +VyA/4XADQ5Tc0cWfrkXtiOugNvfbqVTEWEoZtcocWcLVtfpaQoA1L0QxvKtVk7/TBZWjFQM+qFI
	 vT68aqXfqkOo3NbCwmcUNQ5E9Qc5RSKwfT6qthxpN2dyNBchTAuVx8HCILQwMaNpSe3ucfLKryzU
	 FBSuIa/0C9wzjC0gH7xNYFzthAwLtQ+wCmFM0JzXvjx2rHr8GpF4U/JwcKzDl1TaVLplOkp+b9Op
	 BQxHlMVmShphzGP7K5tAvVVN83YJyqnr8KY3nfQn/Bpp4uYD5Ny5QsubhclrfTDYvrwU5bp+znYS
	 VGTCjyEke+9LMDJaPiiwdJUR1ZkmhgGvOCadV+084p1s7MlhgQfY2V1Nwode87kvKljaOOIDrH7n
	 k4PfvfRx+q5G8BeRg=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/7] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Wed,  6 Mar 2024 04:02:56 +0800
X-OQ-MSGID: <20240305200302.1093082-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_120315_380283_3786240A 
X-CRM114-Status: UNSURE (   6.91  )
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

The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
in Canaan Kendryte K230 SoC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 9d8670c00e3b..e853a7fcee8a 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - thead,c906
+              - thead,c908
               - thead,c910
               - thead,c920
           - const: riscv
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
