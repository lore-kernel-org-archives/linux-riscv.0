Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C2B606A32C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJb25cmr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wP3/L7/x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mrfQiyvqpt72/ifz8lBBkWSqR6dTycgaBfuUKY9p5cA=; b=MJb25cmrQe7KK0h8qzmMT/S5D+
	Sz37fB4hbgtK5zF6H/nP+8e8lEXxjm9BLkeCHZek4hvljox2Isj1yFQPnoODbTMVb7mrw2emvqVB/
	Wvpf2UbGI8P+sjJxf+ElqmuteZweggcmGns57E2p16gfy1bJ4NCKxIe6XIhoErdYGmT3QRdXEuJfJ
	OKYVHvnigTYzWb2cattHw9pgzzYukA4q5q3iqhFK/sXLq7wZr1PjIM5U6QDcU4SHAI4jhP0jLC+rl
	sJfp/3bRkF7CZqUvOkO5XzzyStakOtAPU9FQ9RnsE7UdofFppu7iUsmiszJHUFhdDmsUfeLbtfC+K
	nYGGQ8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIMO-00000008NNO-37U5;
	Thu, 29 Oct 2026 05:07:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIML-00000008NIs-3FE8
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:07:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e946155442so13513485ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250447; x=1793855247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=wP3/L7/x5EGFR551yKoEcPO9HTd1QxmICCxgb8CxX1Go9FRUyFr1ZhT30+n8psOnKq
         cI8ksrrkoanuSdibx9H5k6M+Kd7wCJ9r0YqSmLOB1CymTRotc5iCadTt8Qv10SczPjzp
         TDGHPzrNBoWF30reZAl9zhmc/wo6RpxXB4k7pQf7lT+A+8gz+vS1vULSTPKKgG4phW3u
         G87t+GyIvhil+dnaRkymqzL2uduo27q+smCc9t1pkylQ1HNd7STZAjZ1SQ8s/FmfqFiD
         QwFfgaPfIfKysoLy5TZBXrJTAJ3P2GKVN51CyIu8aOm+6O+aUQ1C0aVsmA81sG5m9+zH
         WHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250447; x=1793855247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=KXybSm5u31YCYVbFFunQzFnIkCxui3JkQkx1xWhgtQXJWlc6epghjPr0Ok8fiiifsd
         KKZgT3GC8FuG120XH4fnAayJJOkPLf040+y0sG0153gEWCyImghRLrAHFKmwEJscgQUL
         pWzT4SIMMGqrk0qeF5wmkV54M932I5x8bsTScuK6B0lSzD+YeVconoV0KwTReCMfcj+P
         CZMn51Ev+GNHR8ca1LqfkNP4+5aeFjbwEvoVrz9uoziFi9upFKR/3/xbXmcVOmOa5z8w
         XVEsi8tet4IHAO0e3SmnMdMokLDiyv3coK9p/P+b8AK8FRRs7GNshVMv/rpq5Jzs80OY
         q7mA==
X-Forwarded-Encrypted: i=1; AKwUvBzIJPozb7k1N+nHHyCX9RtqMSwNIZNK1IquhObyvFoq/+/nSgoc03/x97blYgtj3d8S+8IIIpGpSw9nXw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKepVQB30WgbUdsRnwr416C8Z5s2UEXJETDLBp9NSc8EsQ3NtBk
	V+JLcqo5rVTDFQYE5zElNxq6j60wRhhDnPe0U6lBiodYC9ZkDeRDYFDq
X-Gm-Gg: AYBFou0erjahvx6jYfPicSxLo6DvWcGvKM565oIMETUI619UQ8sajKdIjMoDkchahbJ
	QvQpcSwjGDNfzw7KEy6jLK2GuBUEshg46RoHx04DKrlNlsWD4anwRFAE4XwKjT3RHfbRBjFUEXf
	npAQv0PDAvZZAP4w3bKiBvL/PXGie98WlG9gehzEQND7ug3heIr/HBSqzWWGiMPOf0h9wQsw4KE
	qflgrSKu2wDMV87B5gnmwFmdKIecY8ImOfK2Ww7TDakc1Dx4Yl0a5iVeOrTu2ypUjt5NGq+WBHz
	jwN26Fnnz1niJE5Qd/7eCaKnzC7p/okJGPC0WqswF3U9yI333LQbF779uNw3rrAVy76hi4Gap+9
	hHCAhq752U65vglYCnq+UHRMjdSxw8rrYNCG8r15ws6EB2+IkQJXgYKYrfbxa5Gu+tY0Ij6bTe9
	Snq7f5HHF6a7D8AZghOAClgjq4aDewvx8Ds4at85Uli2jazskQPDPjUxpk2a9TUBIpBbtLaXSKF
	uRiF8bw/BVVNE2ZIfH3O2T2FktlWD4cEmOD0Qzt5r+x7Lh7EwbVqAwhFIvTR5RHfZ1WBCXO8fA6
	Wkd5fmSgbT1llLuop4OP01UTjqKc
X-Received: by 2002:a17:902:d485:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2eb004fc927mr39045165ad.27.1793250447442;
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:52 -0400
Subject: [PATCH RFC 11/12] riscv: defconfig: Enable Bouffalo Lab SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-11-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220729_824954_ECEAAA82 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable support for Bouffalo Lab SoCs in the default configuration and
build the BL808 device trees. The Rust UART driver remains an explicit
configuration choice.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..78a5580021d8cd654c33df931149a2224465285a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -24,6 +24,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
+CONFIG_ARCH_BOUFFALOLAB=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
