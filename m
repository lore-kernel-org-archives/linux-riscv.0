Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84200606CEC7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QvX7+O/o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERsNEgdO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=clRetEd7HX+zAenq7RzN0+cN1MfgM8tf0aBufhnH/9A=; b=QvX7+O/onyacDEizhd2CO+VX0u
	7tl9iOAux6EkbjyGs7yJiA/BYOSRTvF/q+5wtpFvmiE/aheqBUGs4B45ff5zSGWzhYdLZ4S6yVMVh
	fUQGJ92yP4gmUsYOANhXokVquYETaElk0o/U0LFw+VZB/EKb3q0BYSv3C1uJr9uChmouoQrEHIMPQ
	WuOFxS/I3tHSVXAHTemxGHAgLKatoBRye5H/2TYP82Layzn+cMM6CgvgCKVQx4bJDBM6d6YTSnHvw
	aYRESbmpZ2l03KD6WOUBInEKy+gshC3IhmwZLLb2ksYgj9YJCEfv4QxYq6mcA9jdtMs4NIdgNiEj7
	Eqw+IGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvBQ-0000000DkzX-0W08;
	Fri, 13 Nov 2026 17:35:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvBO-0000000Dkyb-0hkP
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 17:35:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c5083bc0e28so263744066b.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 09:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591324; cv=none;
        d=google.com; s=arc-20260327;
        b=En/YqSAbw/it7n1zjR+Qlv4Ed/bMfR0S2ugv91kbSQQ7oaucs5JjgEqe99+LlhPl6Q
         um+TAwfhaQke2/SdWQNGA94xLcpdNU/44Z48hgRU8IrNNmimaJhqvOxpEFoE23ym8dqF
         kgXJNg1JcbUw9Itn/bomGBGcc97apQzL69tVJjTkrzi0NvMseLrjikms+pZiLyHhRXxa
         /kHCY8b8FrNSqRA59AF7FddRCvxaXKEEj2uK/Wv61aAe21oq2c8ltfu21Xv1SoJ5Wi3Y
         MqONI+BMeASlmf56zbhHjNEktA1aeg9wRdu7ItGeeuBndbFPfXciFE3n+DMB+pr4mw1w
         yLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        fh=chMhuDbXI/wlG8VUaKjgsDQS4QEmmTNwTtqjZdlGTRM=;
        b=mKuZmzkDZBe1cZYfzel5s+6DvGB08zNKF2BpwvIXASMT7OCb5Gg9G4eyUoGV6E241v
         zHGvingIPCZ8jcyyzd7E0q1HcJ8nY9fNWjWsvNiXLloINettY5uIyoP+QLuuWEpYt7iX
         pxs6TzEiZbsMfkCYONq5dKr+NEUJDCv9BYv6H2zlbC4gIGEBppB+xG+ZqeFLG5ago1OX
         EDbulDjB6PcvICmIAVaNls0fQ96+DZ7s2j+5YGLES/oVMBFcVqYxF8uz2scUkqielRpw
         15Y4bGnWmaD0yPEWryzV4D5bfCa9EDdmYT6jyMbYSW/Sb6rid2PGQTX1ZmZhmwPv70fZ
         tQFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591324; x=1795196124; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        b=ERsNEgdOa2zVw/pxBoayjK4vwXsOe2hvJ5aXoNaD12uaQJnEcytbOG7m/RlUDxiSrV
         DD1cf7CUt5M4Zd1XfzRGrjH5Dqc6YDloCO78GvktXC/ye+0/ewL4a0lFrIceKupfCMR8
         0MVaK1t/mbLuySwUptpnbm5c5qE/1imhu0snJrkDmtLLXHzG54PQu5N4kDmpMMHWLPOa
         sBF2DBowa6EgXGAw8R4jNwwF5VL/new6qp7hcVkKbgEltxzPySL0SdgwkUvN+5igUI99
         /9Kw2nJtNak3WC2QuFq6SbtCNJnRU4XktnKK/OFEZTToJmfZ7wKLCJPkUQswqYZK5WaZ
         xw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591324; x=1795196124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbq0EeLMJFolx1OncOUqeneC72MUep198Aa3EF0wRf4=;
        b=tbg70MahRQO38L4JP/Qw+khGdL9E4YL2oZwI6Qik4wFcd8NesBVDy7FQCE19hK6rvC
         PX3NgBe83AlKxG923DLTkXMfBuMJfp3i7xNCDvyA5mVToW4AZljyFUcBIKHZ3Uo4bsmn
         EsN1lpcaGmExwF1CKbOb88qSnYwYWPUpsd+4z+kjLntv0NXjOmyViWcsc4Bo0dS1STVG
         vfGSy7hsPS3SjzLL1xsD6i5N4GZvSWnw06jgkkNm0hlNrHlfe1Nn1Wea4o1/+VSdN5x/
         wc6UFcAZHcl25D6kfvRq7GTFGqfmc2bvaqvfoTbBDFg85yjpONe4Q+cNLN2ue90h193h
         2VGA==
X-Forwarded-Encrypted: i=1; AL+hErExyV8nGf0AGzUuikT2C8nk4JCaI6dDrm7GJiUqgw/2PhAOeXTunjpTCBVseNPfdsA3pSNF654seBfvyQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9JUO6+MiQIf96BoWQIDvDYSPwW+/ydA67r/WE3Lz3wwB5ki0xO
	rW0xOR0IqhxMFbs3x2XBWF0cA+edMXYFaoEFZJjbXOL+pSAPGM2iFn4XD7/vwDGFfdMr3NF5CW7
	hudaGjI4RoxuEXL6FSx9m+hzO+JRWT4Y=
X-Gm-Gg: AYBFou0pNYi9Ig+C/dbFmmUQkZ7nLlRSBQWysI/f1vXvfgCqshrvau8x08qA2afOgjD
	/nNkcsTb8UELh1T7kmTraYDB42iB/Sh5xEe5d/iu3rVSH02OQulUICQEQNUDWeSDYkKd95HM4Wy
	DPbjE0nZZo8OpvOQhG3O41hNs12wyccdyL1qKQ6Fp/7z8YG5broaVAeGB2OzKMJi7lS9lHnvQmJ
	/uLzA0WT3onHn2qQx/d6aqFSR3mVdILprSILi+Dsy65QQb5sSLw6wLR1F9ix/H/ZPTTq/RkfN54
	n/ZZzk2c4b1/rk87Loc1MvIzP1aCq6YtqDV0Jjakax38Op4+XN4i4TrUOr8G1mPaorvgNs0IgD5
	cVzlnYOdbY7gIhICIXrgtlOvjghWc7EvlteUcBYPBZ8A/i5AH4ncAnqkDz67KrF6YcjNxXvbLxD
	tPc6UXRinkWThPoZIjG+iAyQ==
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id
 a640c23a62f3a-c50963075ebmr332428566b.15.1794591323523; Fri, 13 Nov 2026
 09:35:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:35:12 +0500
X-Gm-Features: AclHuK_ygvNFFgMQPh62rnosaTlcWUXJwDufLBrg6ePU0sUvfJ5AaEhA0kGAL9M
Message-ID: <CADqcGB=SFQu1F9zasFC8L3Nm8B+dnPG8UUewL8QitFY7bFuriA@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock
 and RTNL in PM callbacks
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, leitao@debian.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_093526_230155_97B7FC5A 
X-CRM114-Status: GOOD (  13.82  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UmV2aWV3ZWQtYnk6IE11aGFtbWFkIEJpbGFsIDxtZWF0dW5pMDAxQGdtYWlsLmNvbT4KCgpPbiBG
cmksIE5vdiAxMywgMjAyNiBhdCA2OjI44oCvUE0gQWxpIFRhcmlxIDxhbGl0YXJpcTQ1ODkyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBmaXhlcyB0d28gbG9ja2luZyBwcm9ibGVt
cyBpbiB0aGUgU3BhY2VtaVQgSzEgRXRoZXJuZXQKPiBkcml2ZXIuCj4KPiBQYXRjaCAxIGZpeGVz
IHRoZSBUWCB0aW1lb3V0IHdvcmssIHdoaWNoIGVuZHMgdXAgd2FpdGluZyBmb3IgaXRzZWxmCj4g
dGhyb3VnaCBjYW5jZWxfd29ya19zeW5jKCkgaW4gZW1hY19kb3duKCksIHNvIGV2ZXJ5IFRYIHRp
bWVvdXQgbGVhdmVzCj4gUlROTCBoZWxkIGZvcmV2ZXIuCj4KPiBQYXRjaCAyIHRha2VzIFJUTkwg
aW4gZW1hY19zdXNwZW5kKCkgYW5kIGVtYWNfcmVzdW1lKCksIHdoaWNoIGZpeGVzIHRoZQo+ICJz
dXNwaWNpb3VzIFJDVSB1c2FnZSIgd2FybmluZyBmcm9tIHBoeV9kaXNjb25uZWN0KCkgb24gc3Vz
cGVuZC4gSXQKPiBkZXBlbmRzIG9uIHBhdGNoIDE6IHN1c3BlbmQgZGlzYWJsZXMgdGhlIFRYIHRp
bWVvdXQgd29yayBiZWZvcmUgdGFraW5nCj4gUlROTCwgc28gaXQgbmV2ZXIgd2FpdHMgZm9yIHRo
ZSB3b3JrIHdoaWxlIGhvbGRpbmcgdGhlIGxvY2suCj4KPiBUZXN0ZWQgb24gT3JhbmdlIFBpIFJW
MiAoU3BhY2VtaVQgSzEpIHdpdGggYSBsb2NrZGVwIGtlcm5lbDogMTIKPiBzdXNwZW5kL3Jlc3Vt
ZSBjeWNsZXMgd2l0aG91dCB0aGUgd2FybmluZy4gVGhlIGJvYXJkIGxvc2VzIGl0cyBuZXR3b3Jr
Cj4gYWZ0ZXIgYWJvdXQgYSBkb3plbiBjeWNsZXMgd2l0aCBvciB3aXRob3V0IHRoaXMgc2VyaWVz
OyB0aGF0IGlzIGEKPiBzZXBhcmF0ZSBpc3N1ZS4KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBOZXcg
cGF0Y2ggMSB0byBmaXggdGhlIFRYIHRpbWVvdXQgd29yayBkZWFkbG9jayAocmVwb3J0ZWQgYnkg
VHJveSwKPiAgIGFwcHJvYWNoIHN1Z2dlc3RlZCBieSBWaXZpYW4pCj4gLSBQYXRjaCAyOiB0YWtl
IFJUTkwgYmVmb3JlIHRoZSBuZXRpZl9ydW5uaW5nKCkgY2hlY2tzCj4gLSBQYXRjaCAyOiBkcm9w
IEJyZW5vJ3MgUmV2aWV3ZWQtYnksIHNpbmNlIHRoZSBwYXRjaCBjaGFuZ2VkCj4KPiB2MTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjYxMTA1MTIzNDQxLjI1MjQxNzEtMS1hbGl0
YXJpcTQ1ODkyQGdtYWlsLmNvbS8KPgo+IEFsaSBUYXJpcSAoMik6Cj4gICBuZXQ6IHNwYWNlbWl0
OiBGaXggVFggdGltZW91dCB3b3JrIGRlYWRsb2NraW5nIG9uIGl0c2VsZgo+ICAgbmV0OiBzcGFj
ZW1pdDogSG9sZCBSVE5MIGxvY2sgaW4gZW1hY19yZXN1bWUoKSBhbmQgZW1hY19zdXNwZW5kKCkK
Pgo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zcGFjZW1pdC9rMV9lbWFjLmMgfCAxOSArKysrKysr
KysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
