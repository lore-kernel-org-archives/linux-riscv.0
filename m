Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD45C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jjgmhbN5YzWwNdB2NbNFn8VikcTxAVAQnn9rMhF9Js=; b=FP2d/kgtazA2ER
	gNjnNAg4J3l6ewU8HPaO4/euFjTdFGPbQL2xCF0i5iYV25VWEZfK2QzfrHKTm/uG8xb2qqDgOv0cH
	Sfnq+ykLwVE0tTMpD79vHvPzj1DHg4p/kArDC2VkC41zLuDGodJx/fG/lS+9RWzEyzCdYlgC7U1OQ
	eHnJM4mi4kQ8tKwdSZJ5E2e0aZhP46DJhWB2JZTDHLjC2p3rfzR/7FDFk6sgfvdanaeKCfVhkboOz
	vUDDiq8Pp2DjtPo7NmQ8k6ff4my4+MHm4/Wj0w0as9Q7yeHXc4WWWxIrEjEz3/VOM91rYijNNsgH6
	3wSBCMcW6ctMTPfBKBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNfo-002kJy-0d;
	Tue, 08 Aug 2023 14:27:00 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNfk-002kJ2-2Y;
	Tue, 08 Aug 2023 14:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1691504786; x=1692109586; i=markus.elfring@web.de;
 bh=2h1cnp+7i9fUhjXgg4fIIyANnSbEt/tBjjSanGzTm9w=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=sMy1W02TK+t3guHL/RIplshZy6GzO+vsId0QBlr8gjZ6btro9QqCADuXxDiGrk+8yw45JMr
 yN4hsN8vz+LrR04KkR5sFRANIRsAV4KNl76bWMz61cjmMMGbb5gAJK11qjiHc1QzG569If59J
 BuxpvP/d9X3vKh1C7h5wUvba3AysQZJeBNGFaj44h33jLFBUKkUm4sA7u3KlsG6DcuVkS0FrW
 8HGMaOy088PfVEyologMtkMW/SFC4FqoKnUrnPG2EQhjuA3fag/g2FTVt2A5at2wQ9E8p8q1t
 KYzR2iHk1A0QbhXW0eMj2ado4GatY/4oayWvVLuiGSiw7r+gWb6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MF2gM-1qa0RV3JfM-00Fgbk; Tue, 08
 Aug 2023 16:26:26 +0200
Message-ID: <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
Date: Tue, 8 Aug 2023 16:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230807191952.2019208-1-contact@jookia.org>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230807191952.2019208-1-contact@jookia.org>
X-Provags-ID: V03:K1:gM1PSsHDeTwsdSH3AAhhWejmf3adkg7Y7GpsIyBwT9yz11NdqPo
 74tLuA2CVu+eTt3MS+Nrr52V56j0asPUEgOdQzzB6js7DyRpJHbvnrlKYm8gyFN8dqBbIQD
 3HWgVLZYKci62SPV0Od61Eipjnjqwukmi18yOV4vEWUecyRPqPUG4nj3uH7sYQyggaNV2OR
 o7pZ8NymJ/oQ1dcvC59Gg==
UI-OutboundReport: notjunk:1;M01:P0:n0L3BnyFqGg=;Es+mmkzXGt5aUZjwCn2+MQbw7BK
 jQB6MLwSaWuZbxY3pcU9Kx6Qv20LIM97lfyfp1ZGqHid5/IJuHLTaFHgbJf5l2X9Q0dcWfRcf
 YxhKkg2jYCxf7GbN916FYRYHaP7kKi6Ev5Jd0u1HeuqqY6VG8QIjh4/QqgMFSRu2G0KXBAqpU
 qrZoxF7USr8OBkrtdWiQJrVXRzw/wPyn5mWcEbpOS2sMxBtCs3kYPH5GGu4yJF9pBQ3uAThtL
 WWdA+NcoOLFJapYggOibiwBPxxBATNPeJKNI40DNQ23x1qIsmlLfe4GjW9fNaSiWxdwFz0R//
 hlZsS++jL25CNKWc2j0fcaV5c0BdXJUQBdttok66zD7GuEdpbL3L12dKkNtQ8IlVazeglYMA5
 X3khfeW7xfhHPNqna5ByRrOWsChwYz/AjyPtCPNubAEAAyn+czDGe3YfSkbUfpUhQKcvV049z
 Gue4fPEcaTfRz4dmbbuH2kMsftuzyZ3ZdSX03LHPSV/Zg3i87SRjCgUrducSU7k6fzCP9l3DT
 HHsfjfLMUPY5R8YEgSwNIM8WBDPdPQHhUL8MBaPqqX7NN4kj18kA56twl8bp3GbWC3GQE7TKU
 3/n9VcDCkJugH3WssS8S4SJg0E8mMzWkTFbbUzESBelfd7RQ3Fb5vPq8sSOQGcsesEfTqfAgW
 9xlARTPcqZFCTlJMM/k5//1+wLTfneVwOoCLU8GtON6x1cLwINKzF48APbLbsmPaYrHKfxHxB
 yVG6ptw/i8zmvXGmN8Cw1MDMqa3jsbSSz7gnEYUOqn7myWCR1G4QP7j0JZoe0v41SfmCkTSrR
 Tch80qYaOTBEtCzQmC5+sxRhDiBNW+Yc9Cij4Lu9nR3OM0x6kAKBAidhs/lD7k7/cz+FYD8Ub
 xqw49hgCdJAL1jLAoWkiAHntB73s35NeK7bEwaDooLcxYRMNZ5336oZTVWoCNa0QF8KdhNBUR
 MiPXOZ+aX50J95FNw2aH1LUvH04=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_072657_268148_A7A9D559 
X-CRM114-Status: UNSURE (   5.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

4oCmCj4gQm90aCBvZiB0aGVzZSBmdWxseSBzdXBwb3J0IGJvdGggQ0FOIGNvbnRyb2xsZXJzLgoK
UGxlYXNlIGNob29zZSBhIGNvcnJlc3BvbmRpbmcgaW1wZXJhdGl2ZSBjaGFuZ2Ugc3VnZ2VzdGlv
bi4KClNlZSBhbHNvOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0
dGluZy1wYXRjaGVzLnJzdD9oPXY2LjUtcmM1I245NAoKCj4gU2lnbmVkLW9mZi1ieTogSm9obiBX
YXR0cyA8Y29udGFjdEBqb29raWEub3JnPgoKSSBmaW5kIHRoZSBsb2NhbC1wYXJ0IG9mIHRoaXMg
ZW1haWwgYWRkcmVzcyBzdXNwaWNpb3VzIGFjY29yZGluZyB0byB0aGUgRGV2ZWxvcGVyJ3MgQ2Vy
dGlmaWNhdGUgb2YgT3JpZ2luLgpTaG91bGQgaXQgdXN1YWxseSBpbmRpY2F0ZSBhbiB1bmlxdWUg
cGVyc29uIGluc3RlYWQgb2YgdGhlIHNob3duIGtleSB3b3JkPwoKUmVnYXJkcywKTWFya3VzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
