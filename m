Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B560606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KTnaqQmD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3gnem/6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I+ODS4XNJrhtn6Uj7I15vMkxPD+shFMAJguynnUVGsY=; b=KTnaqQmDcb5SjwmYBUkWXcDPML
	Ut8JhKBkElNRYURTaM3EvnGphLv3tspGQ4SuqTsuRnwaNUIF8g6Q71pR1xre2m2rkzIae7R6d5lS4
	NSVtF9V9BnGcz0hmt7llHHmGs9YGIcKkXofZgdGLmrA5x1UqYPv94VR0JhSBoykfkQS/QTSJHfWL1
	DJewWzhCaoD7Q4RW0G3InTiRBBMyS3vShrdOjU6y2XgY5pipKceb3DnikyAJuAt5o6o11WWMe1qmN
	MYOOxwLxOpYk8Bk5l/p+wc+tcLNpRNE1tTtSVzVXncM/xDCpw+XVMrJrBSdWe6LU9x//wh5Wmf7vb
	HILB2E4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSB-0000000BYbJ-1Wj0;
	Wed, 25 Nov 2026 23:31:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMS8-0000000BYWs-0UDa
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a9be758734so4027411f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649462; x=1796254262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
        b=e3gnem/6WVM4+FRyT2mvYRaSm9I6PzlDdhGxV4eMWFJhoddYIU45FCoP3s+Flyx4/M
         bkEvmAWlK/rn+9jnDH7LmehUsBqguts1ja879lqa/XHCEqjvcEjfsM+kmBMoZTLzWSVN
         Uv7aIHIlvGIPn3nwkyZgXbvaCOueVZXdLzFQKXFcKKY1us4ze7Y+XT5qKUWDmbKyrL0z
         yQRRPbTj3DK5/Twgv5YrKPTNvAQvxxsNS0I0sfu1s84unUxqQTlc+8DLs45QTQZDKy1O
         TQhEUAuAuS7gdAfkOUh/q+RcecM8RwltOcHYTq/4R6BNOAvLcM0DQpvYJdVUgTnWOiUJ
         NHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649462; x=1796254262;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
        b=h3E+TE8r+F1Etq5/61ScYZ34XT2ZgXyw4jbsfyO6E8IbEsR8zlw/BSWVxkG6OJlPpO
         /QzqtkBjFN80Xh7l/ZAbghT00VoGd77ATQuP1EUUNb5nitwQhOr2ieo6ohdQd1g7UtMU
         c1SZFzCIK9viQZO9GzH5tsaLUABMbl//7qv00Esk6ZrDiqHLoca3HIdcPznrNASTu18I
         Uw7Cc14z35mCvoMDQxnn8VAUMbQ7GVx0l1wlh8H2vtL7PRC2g8xNE6UoSr4p7Sq3nAyx
         W9+jWMflPJCfL+choze8VUh15ltxaU6+zsmt0VC0XwQ2Ygw6exGXJuYQ3+ByEJe66iPH
         reBw==
X-Gm-Message-State: APuU4Z/OVt/Q2KKbhLH3Gq6UwhmYgOqVhvdWVzdveGspJCr5MAW2uU7Q
	Jw77Bf/P7xurYlL8tlzFAAf1d5HXolNl9Oe7j9zVnqcPGJp2Y5wD6jm8wLNc/1ULEv0=
X-Gm-Gg: AZFdTZcPKflFphL3qJXBwgWfzwf62M+GxpKPI8eRoyaly29CrQ89HQUITZ8VJxC2myc
	rRfnPkztaJgClV2UchLqXEYVrd8g44TtZT4zKstkbEXzVKMRZujCY/G9IN+vAGktaqR0Zk4Qw5B
	W0CfghDoEY5UveSpP9LuAcR6BIXIbjwg9wzdYmUUE0IE3+IEwPBGr5I4wm/6sgOUxkuVJtBCKBx
	PqrD7283OGmFPJwOO5BP9LyXcRwXE/BOkpwJcKwkMcCgC3hxFbjXxVzYIk8kVrSYWk5tj+XZZ4P
	5aii0wpT9Y1O0QHOmRx9wYuAsnMQIgM0pECh7Hb/dB58elzaymDLKAgLF/Ai746dJULP00veC8O
	Z+ZcmaXn2xlyEZ2l2BoII2ywp7DZX3NoFYcHvYCk5Faum3P2lViaH0OSEZOwdcamGT9Ztnyz4wK
	ka3juIS8US7JJXBeBR9DXeYW9lrbYaMohMAgeoIp0iBzcpdIMg0CCIMwoJy/KC0NTVHGgSVO4mb
	bMh1QHLuqimUm1NviqFYKGkBMFQhpWglKdNiyEEABNzCgLln4+Uh/tllW0BQU6X7TTKCxGw6b3o
	iFc4UvflucqTS991sbvOn/CMcYUgPAGMgw3umIsN0HTtS4bdUtE/fY/0HzZW9PKkCMj3CRxTp1x
	Y9lcd/7kJHA==
X-Received: by 2002:a5d:5d05:0:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4abaf74024cmr40271517f8f.17.1795649462181;
        Wed, 25 Nov 2026 15:31:02 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm38280390f8f.1.2026.11.25.15.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:01 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH RFC 07/19] dt-bindings: timer: Add Espressif ESP32-P4 CLINT
Date: Wed, 25 Nov 2026 23:30:08 +0000
Message-ID: <20261125233020.1380594-8-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153104_174790_6BD4F909 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RG9jdW1lbnQgdGhlIEVTUDMyLVA0IENMSU5UIGNvbXBhdGlibGUgYW5kIGl0cyBtYWNoaW5lLW1v
ZGUgc29mdHdhcmUKYW5kIHRpbWVyIGludGVycnVwdHMgcm91dGVkIHRvIHRoZSBDTElDLiBBZGQg
YW4gZXhhbXBsZSBzaG93aW5nIGJvdGgKaW50ZXJydXB0IHNwZWNpZmllcnMuCgpBSSBhc3Npc3Rl
ZCB3aXRoIGRyYWZ0aW5nIHRoZSBiaW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogVsOtdG9yIEh1Z28g
U2lsdmEgPHZpdG9yaGcyMDA4MEBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL3RpbWVyL3Np
Zml2ZSxjbGludC55YW1sICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKaW5kZXggZDUzZjUy
ZTgwZDg4Li5lNmQwOGE0ZmY3MDIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKQEAgLTI3LDYgKzI3LDcg
QEAgZGVzY3JpcHRpb246CiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgogICAgIG9uZU9mOgor
ICAgICAgLSBjb25zdDogZXNwLGVzcDMycDQtY2xpbnQKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgogICAgICAgICAgICAgICAtIGNhbmFhbixrMjEwLWNsaW50ICAgICAgICMgQ2Fu
YWFuIEtlbmRyeXRlIEsyMTAKQEAgLTc0LDYgKzc1LDE3IEBAIHByb3BlcnRpZXM6CiAgICAgbWlu
SXRlbXM6IDEKICAgICBtYXhJdGVtczogNDA5NQogCitpZjoKKyAgcHJvcGVydGllczoKKyAgICBj
b21wYXRpYmxlOgorICAgICAgY29uc3Q6IGVzcCxlc3AzMnA0LWNsaW50Cit0aGVuOgorICBwcm9w
ZXJ0aWVzOgorICAgIGludGVycnVwdHMtZXh0ZW5kZWQ6CisgICAgICBpdGVtczoKKyAgICAgICAg
LSBkZXNjcmlwdGlvbjogTWFjaGluZS1tb2RlIHNvZnR3YXJlIGludGVycnVwdAorICAgICAgICAt
IGRlc2NyaXB0aW9uOiBNYWNoaW5lLW1vZGUgdGltZXIgaW50ZXJydXB0CisKIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQogCiByZXF1aXJlZDoKQEAgLTkxLDQgKzEwMywyMCBAQCBleGFtcGxl
czoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRpbnRjIDM+LCA8JmNwdTRpbnRj
IDc+OwogICAgICAgcmVnID0gPDB4MjAwMDAwMCAweDEwMDAwPjsKICAgICB9OworICAtIHwKKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+CisKKyAg
ICB0aW1lckAyMDAwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZXNwLGVzcDMycDQtY2xp
bnQiOworICAgICAgICByZWcgPSA8MHgyMDAwMDAwMCAweDEwMDAwPjsKKyAgICAgICAgaW50ZXJy
dXB0cy1leHRlbmRlZCA9IDwmY2xpYyAzIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPCZjbGljIDcgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAg
fTsKKworICAgIGNsaWM6IGludGVycnVwdC1jb250cm9sbGVyQDIwODAwMDAwIHsKKyAgICAgICAg
Y29tcGF0aWJsZSA9ICJlc3AsZXNwMzJwNC1jbGljIjsKKyAgICAgICAgcmVnID0gPDB4MjA4MDAw
MDAgMHgxMDAwMD47CisgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOworICAgICAgICAjaW50
ZXJydXB0LWNlbGxzID0gPDI+OworICAgIH07CiAuLi4KLS0gCjIuNTYuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
