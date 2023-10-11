Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07554CD6E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IR3bBFxI7na8xhPNgWotY1NvTd7lpkK48bPrp5pHiBw=; b=CyaPgZNDd57X+I
	d/93vZuWpa+EszkeQ+PCz+qq1InrqVKqlCJSu/N/VvWz0TQP5DdIT2CW4npUDzAk71B2R36Uw3tt+
	n586F2/1PfZbI250d57tcfkxAXSCONPuArx6rWKCLbRcVP6jOIk1/40AqVPR6vNoPZk3f7CmzCYps
	rCQ5xj6f5YCBy54lYGWNs7PPiEHLqrTALOKhmG/FZnzyaMuYNv+odoUXWlekMTOqI9R+UmEC+ynB5
	o4aMFmlv0RkfHiMM2ivVqKaPcOqpJUQgxysNksvkes6Rad8geXqEV9uOcJeDg4D3YNqzHHZDKWXo7
	gs9ohZQTQoDSXq0nJxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFP-00FjMn-1q;
	Wed, 11 Oct 2023 11:19:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFH-00FjFt-2f
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558105e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023158; x=1697627958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v10+31krjXZc/qlT0HyTU3dzvB5HQq7PuU+rQhdNiSY=;
        b=Pr7IGLrzMvOYmp+FLspqCL/EhA51FQRK5LEUYMy10p+/W1Lc+jbM4kAIyj0ab0WU/b
         1zURTM1vkUOD49oUPJM3ucU5zkCGbdQszKkStEmBDu5yjNofqMIdyvN34KjPAf6EMVpL
         755K5w3aQ1T32beLlNWHc2gxuCpeVo7Pk+cOiaop9vWcGg/4Jftc3zclpJPadYXAlK30
         V3PE4hxarXa9+X/sIO/O7lg3Btdgw1ZVOTW1qnTLDF6VSWqsSt5yaquBk9sKLxQUje3S
         DDjJ74jgZkq7ezMoYO9/R4TIAh3z90r2/bX7GO3Hkd/zfZBjY8YidTMr+A7JvRTpkCKX
         ng7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023158; x=1697627958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v10+31krjXZc/qlT0HyTU3dzvB5HQq7PuU+rQhdNiSY=;
        b=u0Q9NocHOwgZJOSNXiilaZUn4IkW6lywZVEPVmWB8+UO+Fx08zKYlMMh/FMFWwptYJ
         bHAWRDa0GOQfAJ3OKdHikaO9iJPUVeFYOVZWZwV/HEI0SmM/vThUqtsx7MTLQF7Arr7w
         9u01xoTntPppNgl59LkvEZ3s692Xw67rDKvqZvS0SfxC53atsf1XYUdNuDOvpNgKsWP/
         GKWIWYQI2g1jpjEDMRIehv5UoTbHeuYf6JKFtvm+/M4CvGqt8j0N01JJNb2dSpFwNLTp
         95TsqGdT1LoMwgW/2DpJlnYxkz2ofv7LxUt2TMguzam04qM2/geRBkI5aor3vBkPL7EC
         q1NQ==
X-Gm-Message-State: AOJu0YwrbGCAeqRuD9RrbBNQdlK3WhaOGx9nmpt9lUJC15WEGnSPwaQC
	s+a61ZlWDxPA8wGmtvc+7h1TCxaF3yPsYErYiEJBGg==
X-Google-Smtp-Source: AGHT+IFNRKBFCJ+sq9h6X2aRCAID+o1DHOTC+J5HSWPZUWo4633mGqFeaz/hdUQyMTe8ebdkfymsdA==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr18787455wml.2.1697023157473;
        Wed, 11 Oct 2023 04:19:17 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:17 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 04/13] dt-bindings: riscv: add Zv* ratified crypto ISA extensions description
Date: Wed, 11 Oct 2023 13:14:29 +0200
Message-ID: <20231011111438.909552-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041919_865110_B7AD6AE7 
X-CRM114-Status: UNSURE (   8.97  )
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

QWRkIFp2KiB2ZWN0b3IgY3J5cHRvIGV4dGVuc2lvbnMgdGhhdCB3ZXJlIGFkZGVkIGluICJSSVND
LVYgQ3J5cHRvZ3JhcGh5CkV4dGVuc2lvbnMgVm9sdW1lIElJIiBzcGVjaWZpY2F0aW9uaVsxXToK
Ci0gWnZiYjogVmVjdG9yIEJhc2ljIEJpdC1tYW5pcHVsYXRpb24KLSBadmJjOiBWZWN0b3IgQ2Fy
cnlsZXNzIE11bHRpcGxpY2F0aW9uCi0gWnZrYjogVmVjdG9yIENyeXB0b2dyYXBoeSBCaXQtbWFu
aXB1bGF0aW9uCi0gWnZrZzogVmVjdG9yIEdDTS9HTUFDLgotIFp2a25lZDogTklTVCBTdWl0ZTog
VmVjdG9yIEFFUyBCbG9jayBDaXBoZXIKLSBadmtuaFthYl06IE5JU1QgU3VpdGU6IFZlY3RvciBT
SEEtMiBTZWN1cmUgSGFzaAotIFp2a3NlZDogU2hhbmdNaSBTdWl0ZTogU000IEJsb2NrIENpcGhl
cgotIFp2a3NoOiBTaGFuZ01pIFN1aXRlOiBTTTMgU2VjdXJlIEhhc2gKLSBadmtuOiBOSVNUIEFs
Z29yaXRobSBTdWl0ZQotIFp2a25jOiBOSVNUIEFsZ29yaXRobSBTdWl0ZSB3aXRoIGNhcnJ5bGVz
cyBtdWx0aXBseQotIFp2a25nOiBOSVNUIEFsZ29yaXRobSBTdWl0ZSB3aXRoIEdDTS4KLSBadmtz
OiBTaGFuZ01pIEFsZ29yaXRobSBTdWl0ZQotIFp2a3NjOiBTaGFuZ01pIEFsZ29yaXRobSBTdWl0
ZSB3aXRoIGNhcnJ5bGVzcyBtdWx0aXBsaWNhdGlvbgotIFp2a3NnOiBTaGFuZ01pIEFsZ29yaXRo
bSBTdWl0ZSB3aXRoIEdDTS4KLSBadmt0OiBWZWN0b3IgRGF0YS1JbmRlcGVuZGVudCBFeGVjdXRp
b24gTGF0ZW5jeS4KClsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFnYjlPTEgt
RGhiQ2dXcDdWd3BQT1Zyclk2ZjNvU0pMTC92aWV3CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgOTYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDk2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAppbmRleCBjYzFmNTQ2ZmRiZGMu
LjQwMDJjNjUxNDVjOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0yNDYsNSArMjQ2LDEwMSBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgICAgICAgaW4gY29tbWl0IDJlNTIzNiAoIlp0c28gaXMgbm93IHJhdGlm
aWVkLiIpIG9mIHRoZQogICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KIAorICAgICAgICAt
IGNvbnN0OiB6dmJiCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3Rh
bmRhcmQgWnZiYiBleHRlbnNpb24gZm9yIHZlY3RvcmVkIGJhc2ljIGJpdC1tYW5pcHVsYXRpb24K
KyAgICAgICAgICAgIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUg
KCJVcGRhdGUKKyAgICAgICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2Yg
cmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29uc3Q6IHp2YmMKKyAgICAgICAgICBkZXNjcmlw
dGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmJjIGV4dGVuc2lvbiBmb3IgdmVjdG9y
ZWQgY2FycnlsZXNzIG11bHRpcGxpY2F0aW9uCisgICAgICAgICAgICBpbnN0cnVjdGlvbnMsIGFz
IHJhdGlmaWVkIGluIGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCisgICAgICAgICAgICByaXNjdi1j
cnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNv
bnN0OiB6dmtiCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgWnZrYiBleHRlbnNpb24gZm9yIHZlY3RvciBjcnlwdG9ncmFwaHkgYml0LW1hbmlwdWxhdGlv
bgorICAgICAgICAgICAgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5
NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKSBv
ZiByaXNjdi1jcnlwdG8uCisKKyAgICAgICAgLSBjb25zdDogenZrZworICAgICAgICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a2cgZXh0ZW5zaW9uIGZvciB2ZWN0
b3IgR0NNL0dNQUMgaW5zdHJ1Y3Rpb25zLCBhcworICAgICAgICAgICAgcmF0aWZpZWQgaW4gY29t
bWl0IDU2ZWQ3OTUgKCJVcGRhdGUgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKQorICAg
ICAgICAgICAgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29uc3Q6IHp2a24KKyAgICAg
ICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmtuIGV4dGVuc2lv
biBmb3IgTklTVCBhbGdvcml0aG0gc3VpdGUgaW5zdHJ1Y3Rpb25zLCBhcworICAgICAgICAgICAg
cmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUgcmlzY3YtY3J5cHRvLXNwZWMtdmVj
dG9yLmFkb2MiKQorICAgICAgICAgICAgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29u
c3Q6IHp2a25jCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgWnZrbmMgZXh0ZW5zaW9uIGZvciBOSVNUIGFsZ29yaXRobSBzdWl0ZSB3aXRoIGNhcnJ5bGVz
cworICAgICAgICAgICAgbXVsdGlwbHkgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21t
aXQgNTZlZDc5NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9y
LmFkb2MiKSBvZiByaXNjdi1jcnlwdG8uCisKKyAgICAgICAgLSBjb25zdDogenZrbmVkCisgICAg
ICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZrbmVkIGV4dGVu
c2lvbiBmb3IgVmVjdG9yIEFFUyBibG9jayBjaXBoZXIKKyAgICAgICAgICAgIGluc3RydWN0aW9u
cywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUKKyAgICAgICAgICAgIHJp
c2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAg
IC0gY29uc3Q6IHp2a25nCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWnZrbmcgZXh0ZW5zaW9uIGZvciBOSVNUIGFsZ29yaXRobSBzdWl0ZSB3aXRoIEdD
TQorICAgICAgICAgICAgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5
NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKSBv
ZiByaXNjdi1jcnlwdG8uCisKKyAgICAgICAgLSBjb25zdDogenZrbmhhCisgICAgICAgICAgZGVz
Y3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmtuaGEgZXh0ZW5zaW9uIGZv
ciBOSVNUIHN1aXRlOiB2ZWN0b3IgU0hBLTIgc2VjdXJlLAorICAgICAgICAgICAgaGFzaCAoU0hB
LTI1NiBvbmx5KSBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAgICAg
ICAgNTZlZDc5NSAoIlVwZGF0ZSByaXNjdi1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJp
c2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtuaGIKKyAgICAgICAgICBkZXNjcmlw
dGlvbjogfAorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a25oYiBleHRlbnNpb24gZm9yIE5J
U1Qgc3VpdGU6IHZlY3RvciBTSEEtMiBzZWN1cmUsCisgICAgICAgICAgICBoYXNoIChTSEEtMjU2
IGFuZCBTSEEtNTEyKSBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAg
ICAgICAgNTZlZDc5NSAoIlVwZGF0ZSByaXNjdi1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9m
IHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtzCisgICAgICAgICAgZGVzY3Jp
cHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZrcyBleHRlbnNpb24gZm9yIFNoYW5n
TWkgYWxnb3JpdGhtIHN1aXRlCisgICAgICAgICAgICBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVk
IGluIGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCisgICAgICAgICAgICByaXNjdi1jcnlwdG8tc3Bl
Yy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtz
YworICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a3Nj
IGV4dGVuc2lvbiBmb3IgU2hhbmdNaSBhbGdvcml0aG0gc3VpdGUgd2l0aAorICAgICAgICAgICAg
Y2FycnlsZXNzIG11bHRpcGxpY2F0aW9uIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29t
bWl0IDU2ZWQ3OTUKKyAgICAgICAgICAgICgiVXBkYXRlIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rv
ci5hZG9jIikgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29uc3Q6IHp2a3NlZAorICAg
ICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZrc2VkIGV4
dGVuc2lvbiBmb3IgU2hhbmdNaSBzdWl0ZTogU000IGJsb2NrIGNpcGhlcgorICAgICAgICAgICAg
aW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5NSAoIlVwZGF0ZQorICAg
ICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKSBvZiByaXNjdi1jcnlwdG8u
CisKKyAgICAgICAgLSBjb25zdDogenZrc2gKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAg
ICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a3NoIGV4dGVuc2lvbiBmb3IgU2hhbmdNaSBzdWl0ZTog
U00zIHNlY3VyZSBoYXNoCisgICAgICAgICAgICBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGlu
IGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCisgICAgICAgICAgICByaXNjdi1jcnlwdG8tc3BlYy12
ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtzZwor
ICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a3NnIGV4
dGVuc2lvbiBmb3IgU2hhbmdNaSBhbGdvcml0aG0gc3VpdGUgd2l0aCBHQ00KKyAgICAgICAgICAg
IGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUKKyAg
ICAgICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5cHRv
LgorCisgICAgICAgIC0gY29uc3Q6IHp2a3QKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCB6dmt0IGV4dGVuc2lvbiBmb3IgdmVjdG9yIGRhdGEtaW5kZXBl
bmRlbnQgZXhlY3V0aW9uCisgICAgICAgICAgICBsYXRlbmN5LCBhcyByYXRpZmllZCBpbiBjb21t
aXQgNTZlZDc5NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9y
LmFkb2MiKSBvZiByaXNjdi1jcnlwdG8uCisKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCiAu
Li4KLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
