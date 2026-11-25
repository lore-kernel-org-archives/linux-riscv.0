Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788C606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=znxW2yE+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBSRqZGH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2rEqERAbaCaOmNNQ9TJt6zVWlQObxpvbAEQjifCoj4Y=; b=znxW2yE+gLcSbRd2H1mQULWpKW
	HzzVn1Y+An9hEK/iySEKGtiAMyqul6yvy8sFNlmAV7y+yv3z+9bUj9xlk8qUWzrtxissXfLcfwnLP
	QKVlxyIlcpi3vom+HXFwlloDo8aWt8rp59iBn5CkBm0LdKsFw862e349Fdf2il7BG4dR1Mj+gz8Z3
	wrvCr9i0ODedq8HbkkZtDBGxb78KufvbF1KkylS2oDfhCF/CsQp6I8qdk1QQk3lFSx9eG+YiBKk96
	NpHbNbKs28UHmhwDXaOQzXL7zt7SKGyzTzGSj6haGBiHJYe6MSBMZrySojes0WBSX/2AYeuBDzve5
	IzaxU3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRt-0000000BYOC-3XE4;
	Wed, 25 Nov 2026 23:30:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRq-0000000BYLQ-36Ec
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:30:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso63507405e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649444; x=1796254244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
        b=KBSRqZGHQhPj3WDTlPU+aCi+Bw+n75pNMkYbsEBtTuSkoGMhYX2kVb4UG3SLurER7p
         4G1HadarqsLJ47Iri/QWsnSqEWeODdX+G59tw2fG66/Xqo0ISBHyH8x0wMaSuBit5Czs
         OXLKEXwno0En7R4zTfdmFMT6jEB482dlnEYpG0o4Z2g/FfITZA21WPuWXpRJhtYInhUJ
         rC6X6Loqoki+DjFdDa7/C0fQyIwlHk+ujGVmlQM1QAmmyKmvAi0arcox1rc5AiKWKU0m
         WN3oYB2V1KhTlS3vq+bQquaLz0gqUrRn7g7xLyypPutwheXDpiZ8e50tN4CrAso6V8Fx
         H0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649444; x=1796254244;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZKFlp5gsRNkBx+db2V3y4H9FikR2/7OfwVsqbLrwRM=;
        b=N84IyQEVtO1UCzRFfjhatiU1eDNUDRz4QkrSDEY5EugnJO0oS0nKlCMAIYeK2ekj3S
         UinWHuX3NM0WiE2JhwGKZ4PYFhJKuKz4Iz8eZP+PW96hzmwP8eEHJohhXsNf2ytm4NOD
         bcKNnd/bMYv15pqwNreA2GU8CahNZbBq8swgnpcPkusd0GhI0J6MceJNvLeqWLXKPTTu
         BbgSTG41keaMgATTp3wVvAeoc6p4or1nMAg8v/yt+L8G1wk+BGTk4cgAu4uTILrB3EJl
         92fivV+eiw4kus6xc8vTOZPOH+/Tc3QBsrKjNGDLcuWV7Ez6RAaJiDs7G/ygUdII1y1K
         sLSQ==
X-Gm-Message-State: APuU4Z+EF1AaNdTHRFRp8yjvJ3cZpkR1Re2AduU49f3IGLBMFyAfo0Vc
	CccWiLnRmvuDjG0IrGPDD7NO9iESZPHd3uTpdPvw1i7AtV+TUT1m+dHmoaAtZJIe7og=
X-Gm-Gg: AZFdTZfEviYhO7UFsDuhB0Wn0g/btrMdQ3kQFhptOSno5jponpe3AXUQ4UwZokzYIuB
	91sfsLXdKLj7zJh7NgxLSsZSoHGu+Z4Uzw7dYWroFERL6qe/dDwvazMMM9tS+KRPu8L379w1NiL
	e2kwIyHxBKV2HR14Nh8c28L1JmCCnRprIF+VJLZxOIr6LhDScDX02zAdYChpUPNW9M9uYkl68rt
	/4wJKXqSAqTpLTfottpy9I+uiSWuAVMS7gi3YUlPsMwd0hg/+5yyEy0Yat8qhQTTyROS2YdYLkF
	UdjA0maT9TjHe5JvdSnHvmTSs2WsNjRbcUWxZGknP2Hes0Lh4HaKKBBeAnFtaWz+GiyTp83Y/G5
	rUZv97sl0iDDT/9kn70Zlh091BPs/97azDtTPd9Ba6JFdmmVAwINQ0v68O+AcgfcPnY3fYMZS0v
	ffqNClQm6opfPaHEuzR5HInl/XphYcrjgSJZzudprsywSSwNT6lcf00h5fFLjV2BivvNjxtr09P
	LatqwDczh3WuUu0w+C0c1Irm8D6bnp9HC5mtiyd31y+BX368VKZHtXJHyo1AotsRPxXLdr488aM
	j+fRH1IV1HTYOjV4hI7lAV358cHJUp2NJW54nbXsLgVwiIziLGSWt5nX1MPCsmxR9t5DEq+QtmU
	mECgMw4cnbW8pJin1yz5sBo1CjMM7msU=
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr407121945e9.34.1795649443783;
        Wed, 25 Nov 2026 15:30:43 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36428994f8f.49.2026.11.25.15.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:43 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 03/19] dt-bindings: interrupt-controller: Add Espressif ESP32-P4 CLIC
Date: Wed, 25 Nov 2026 23:30:04 +0000
Message-ID: <20261125233020.1380594-4-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153046_797077_F63DC69D 
X-CRM114-Status: GOOD (  13.62  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGVzY3JpYmUgdGhlIG1lbW9yeS1tYXBwZWQgY29yZS1sb2NhbCBpbnRlcnJ1cHQgY29udHJvbGxl
ciBvbiB0aGUgRVNQMzItUDQuCkRlZmluZSBpdHMgdHdvLWNlbGwgaW50ZXJydXB0IHNwZWNpZmll
ciBhcyB0aGUgQ0xJQyBpbnRlcnJ1cHQgbnVtYmVyIGFuZAp0cmlnZ2VyIHR5cGUuCgpBSSBhc3Np
c3RlZCB3aXRoIGRyYWZ0aW5nIHRoZSBzY2hlbWEuCgpTaWduZWQtb2ZmLWJ5OiBWw610b3IgSHVn
byBTaWx2YSA8dml0b3JoZzIwMDgwQGdtYWlsLmNvbT4KLS0tCiAuLi4vZXNwLGVzcDMycDQtY2xp
Yy55YW1sICAgICAgICAgICAgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9lc3AsZXNwMzJw
NC1jbGljLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvZXNwLGVzcDMycDQtY2xpYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2VzcCxlc3AzMnA0
LWNsaWMueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjJlZjM2
ZTRlNDAxOQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9lc3AsZXNwMzJwNC1jbGljLnlhbWwKQEAgLTAsMCAr
MSw1MyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9pbnRlcnJ1cHQtY29udHJvbGxlci9lc3AsZXNwMzJwNC1jbGljLnlhbWwjCiskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6
IEVzcHJlc3NpZiBFU1AzMi1QNCBDb3JlLUxvY2FsIEludGVycnVwdCBDb250cm9sbGVyCisKK21h
aW50YWluZXJzOgorICAtIFbDrXRvciBIdWdvIFNpbHZhIDx2aXRvcmhnMjAwODBAZ21haWwuY29t
PgorCitkZXNjcmlwdGlvbjoKKyAgRWFjaCBoaWdoLXBlcmZvcm1hbmNlIFJJU0MtViBjb3JlIGhh
cyBhIENMSUMgdGhhdCByZWNlaXZlcyB0aGUgbG9jYWwKKyAgc29mdHdhcmUgYW5kIHRpbWVyIGlu
dGVycnVwdHMgYW5kIGludGVycnVwdHMgZnJvbSB0aGUgaW50ZXJydXB0IG1hdHJpeC4KKworcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgorICAgICAgLSBlc3AsZXNwMzJwNC1j
bGljCisgICAgICAtIGVzcCxlc3AzMnA0LXYzLWNsaWMKKworICByZWc6CisgICAgbWF4SXRlbXM6
IDEKKworICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQorCisgICcjaW50ZXJydXB0LWNlbGxz
JzoKKyAgICBjb25zdDogMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhlIGZpcnN0IGNlbGwg
aXMgdGhlIENMSUMgaW50ZXJydXB0IG51bWJlci4gSW50ZXJydXB0cyAzIGFuZCA3IGFyZQorICAg
ICAgdGhlIGxvY2FsIG1hY2hpbmUtbW9kZSBzb2Z0d2FyZSBhbmQgdGltZXIgaW50ZXJydXB0cywg
cmVzcGVjdGl2ZWx5LgorICAgICAgSW50ZXJydXB0cyAxNiB0aHJvdWdoIDQ3IGFyZSBpbnB1dHMg
ZnJvbSB0aGUgaW50ZXJydXB0IG1hdHJpeC4KKworICAgICAgVGhlIHNlY29uZCBjZWxsIGlzIHRo
ZSB0cmlnZ2VyIHR5cGUgZGVmaW5lZCBpbgorICAgICAgZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvaXJxLmguIFVzZSBJUlFfVFlQRV9MRVZFTF9ISUdIIGZvcgorICAgICAgdGhlIGxv
Y2FsIENMSU5UIGludGVycnVwdHMgYW5kIGZvciBzaWduYWxzIGZyb20gdGhlIGludGVycnVwdCBt
YXRyaXguCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBpbnRlcnJ1
cHQtY29udHJvbGxlcgorICAtICcjaW50ZXJydXB0LWNlbGxzJworCithZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIGludGVycnVwdC1jb250cm9sbGVy
QDIwODAwMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJlc3AsZXNwMzJwNC1jbGljIjsKKyAg
ICAgICAgcmVnID0gPDB4MjA4MDAwMDAgMHgxMDAwMD47CisgICAgICAgIGludGVycnVwdC1jb250
cm9sbGVyOworICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+OworICAgIH07Ci0tIAoyLjU2
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
