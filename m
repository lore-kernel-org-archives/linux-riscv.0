Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2652BC369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u0JhlGfyOLAdKSAQiiqmyIp0JXf8dzu1laSoga26diU=; b=ZjcNkZVzkIXqlZrHdID9wwm/Pn
	N0M6Mn7A5XxnpuoHk4pkqTJ9ZguZTCyaO7V1x3lzT2iRadB5noWekHGPMpy9CzqYF4sarYPwLoBb6
	hqD77zha0GZB/6SROwjL0cvP4oTYMEbcm5KLAaEXdIRBvP5oU2yUNaF1KeRuI/yfmPkY1CIp3sNg6
	5CPfbsC76MYaK92VV3WzfAqxqsHPyKpzMrQVcFd8TSeQVOZHt1ymewWj6tNf4lWBr3aI6CcyscRh9
	AS9dGnisl0hnxCaffMxCQDO/mn2ot9FNt37sPzsDza1dJYi78U+6tH5Cn0vRr2wY/+tJ4uL/u/APY
	v63Va2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgx-0000000E5vK-3JEQ;
	Wed, 07 May 2025 03:43:31 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgv-0000000E5sz-2uL7
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:43:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22e166874aeso35362445ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589409; x=1747194209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xzvwhqpet2wKikEpSs/exbZDwf74+YM6WPqZRUaUv4c=;
        b=Lkz4yrtTrV6VxyB6htltlYTzDuufAeTPvWiteYpnaBlRv0ObKLVD3VYELxkKdwfKxX
         +VRI+XijgtK2BBraFFTUn9CbwiXrBFU7XfsDuhlHaImhRX6sXumg+ciquStZAn3FrGwd
         egQBhh315yaX0dFXj8X2bssnVPENMZTQWwEvA0aS0CGFZC9oq7ORM0nhqOUdS3K64fCn
         eKooMP59HpJ1EGG9DiPzHSZ+F1ZomK5I57GrhjY0ycwZvvwVXp8obQn6cQGKpFQOzZlN
         k+KM8BCcQP/A3DCHa4SWX6WUSVqZ6U0gbFfiJ7boKJuWJLe5QViQhFxFkmJumUOhe6ji
         e5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589409; x=1747194209;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xzvwhqpet2wKikEpSs/exbZDwf74+YM6WPqZRUaUv4c=;
        b=i2H8J68UCKzSnnZzEsYFkB/lNHjoOQyr5cOm5qrJcg1D86E/0kXwU/eZQ6O8xSrXRv
         OrSCqnkmyumBu8LOsieLvj2Z+JfrZoid7nBg8DBfvu64mn+cxqpDSA+Rq3DN/c6mPCCS
         e+ew1rrpi7AYeoLfyavr4OzmRXiuojemYcuABUoBKrDspxm6/duiaZY954bQYRlERFjW
         U0qI7YkqJlk3wJ/VaewtRHH94dEl977+qSLROd7nEWrruOAYm1h/ts2UG4iUFoWaqynF
         gBsWFgphtvJtgVAGI8NE+pzTS3a7Ody3aNtkUq/i3YbqhslCi3Ywkxq4VmNoj9f/DMa5
         qFLA==
X-Forwarded-Encrypted: i=1; AJvYcCVKY3a4R6UZhewuScOWe2x3PRftS5HDaBD+FMpikCDx6Kqbzo09UWLQfjR2ITs+qyOkP4FRgmJCVcU+Bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFOSRtX1skn8u5Nxi55lfeBYrdkNbsLWYQIJubnFWl4rNUatLE
	KY0GUX0NpUkzhK2N7pB3o8qARPNexKnQfaTOuPUh85OnwVAOmb+FQelLp8hTMg+mioOFLzWMiYz
	/JB7aruDTdQ==
X-Google-Smtp-Source: AGHT+IEtoQx5D2S9W7WAmHeQNr3gJVW7PqfCB40WHN0EShgVdc/0yI0wAxRoW5BJaCzOHqdGbwsUKwFn2rFGAA==
X-Received: from plbkr8.prod.google.com ([2002:a17:903:808:b0:223:f441:fcaa])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f54b:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-22e5ea1d27emr23509275ad.9.1746589408717;
 Tue, 06 May 2025 20:43:28 -0700 (PDT)
Date: Wed,  7 May 2025 03:43:25 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <11097fd515f10308b3941469ee4c86cb8872db3f.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 7/8] selftests/bpf: Verify zero-extension behavior
 in load-acquire tests
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204329_732639_AE18B777 
X-CRM114-Status: UNSURE (   9.08  )
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

VmVyaWZ5IHRoYXQgOC0sIDE2LSBhbmQgMzItYml0IGxvYWQtYWNxdWlyZXMgYXJlIHplcm8tZXh0
ZW5kaW5nIGJ5IHVzaW5nCmltbWVkaWF0ZSB2YWx1ZXMgd2l0aCB0aGVpciBoaWdoZXN0IGJpdCBz
ZXQuICBEbyB0aGUgc2FtZSBmb3IgdGhlIDY0LWJpdAp2YXJpYW50IHRvIGtlZXAgdGhlIHN0eWxl
IGNvbnNpc3RlbnQuCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4K
UmV2aWV3ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+ClRlc3RlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPiAjIFFFTVUvUlZBMjMKU2lnbmVkLW9mZi1i
eTogUGVpbGluIFllIDx5ZXBlaWxpbkBnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9sb2FkX2FjcXVpcmUuYyB8IDggKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2xvYWRfYWNxdWly
ZS5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2xvYWRfYWNx
dWlyZS5jCmluZGV4IGE2OTZhYjg0YmZkNi4uNzRmNGYxOWMxMGI4IDEwMDY0NAotLS0gYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfbG9hZF9hY3F1aXJlLmMKKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2xvYWRfYWNxdWly
ZS5jCkBAIC0xNSw3ICsxNSw3IEBAIF9fbmFrZWQgdm9pZCBsb2FkX2FjcXVpcmVfOCh2b2lkKQog
ewogCWFzbSB2b2xhdGlsZSAoCiAJInIwID0gMDsiCi0JIncxID0gMHgxMjsiCisJIncxID0gMHhm
ZTsiCiAJIioodTggKikocjEwIC0gMSkgPSB3MTsiCiAJIi44Ynl0ZSAlW2xvYWRfYWNxdWlyZV9p
bnNuXTsiIC8vIHcyID0gbG9hZF9hY3F1aXJlKCh1OCAqKShyMTAgLSAxKSk7CiAJImlmIHIyID09
IHIxIGdvdG8gMWY7IgpAQCAtMzUsNyArMzUsNyBAQCBfX25ha2VkIHZvaWQgbG9hZF9hY3F1aXJl
XzE2KHZvaWQpCiB7CiAJYXNtIHZvbGF0aWxlICgKIAkicjAgPSAwOyIKLQkidzEgPSAweDEyMzQ7
IgorCSJ3MSA9IDB4ZmVkYzsiCiAJIioodTE2ICopKHIxMCAtIDIpID0gdzE7IgogCSIuOGJ5dGUg
JVtsb2FkX2FjcXVpcmVfaW5zbl07IiAvLyB3MiA9IGxvYWRfYWNxdWlyZSgodTE2ICopKHIxMCAt
IDIpKTsKIAkiaWYgcjIgPT0gcjEgZ290byAxZjsiCkBAIC01NSw3ICs1NSw3IEBAIF9fbmFrZWQg
dm9pZCBsb2FkX2FjcXVpcmVfMzIodm9pZCkKIHsKIAlhc20gdm9sYXRpbGUgKAogCSJyMCA9IDA7
IgotCSJ3MSA9IDB4MTIzNDU2Nzg7IgorCSJ3MSA9IDB4ZmVkY2JhMDk7IgogCSIqKHUzMiAqKShy
MTAgLSA0KSA9IHcxOyIKIAkiLjhieXRlICVbbG9hZF9hY3F1aXJlX2luc25dOyIgLy8gdzIgPSBs
b2FkX2FjcXVpcmUoKHUzMiAqKShyMTAgLSA0KSk7CiAJImlmIHIyID09IHIxIGdvdG8gMWY7IgpA
QCAtNzUsNyArNzUsNyBAQCBfX25ha2VkIHZvaWQgbG9hZF9hY3F1aXJlXzY0KHZvaWQpCiB7CiAJ
YXNtIHZvbGF0aWxlICgKIAkicjAgPSAwOyIKLQkicjEgPSAweDEyMzQ1Njc4OTBhYmNkZWYgbGw7
IgorCSJyMSA9IDB4ZmVkY2JhMDk4NzY1NDMyMSBsbDsiCiAJIioodTY0ICopKHIxMCAtIDgpID0g
cjE7IgogCSIuOGJ5dGUgJVtsb2FkX2FjcXVpcmVfaW5zbl07IiAvLyByMiA9IGxvYWRfYWNxdWly
ZSgodTY0ICopKHIxMCAtIDgpKTsKIAkiaWYgcjIgPT0gcjEgZ290byAxZjsiCi0tIAoyLjQ5LjAu
OTY3Lmc2YTBkZjNlY2MzLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
