Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB63C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR1B7/lCE8KmBYQVSdmjg2Bvv2/zscL65fXlZgvDldk=; b=AbeFcsWW3U7ToW/5KTPW424PBr
	OoQUu6AQ9H/0Wb70Dh8bZ8Y3aPb4tXVn1SKVF6MeTbR2192bXzKbC6mclZHMn0lvEED2/OClN7WMe
	unIglYFmEgCxAVJClsOXl2xr72Ko2MPewJICa+Il3LyPAw+d60nNuaUr3L4+0+sskMRXBVjnn5PYI
	CM3QN5uOBjxeMHnQHxbuT3P1eAiWzZup7+9X7QmnzwFChcoD9u4EoJPqRNxVBUC0Mi3B87P+1stGV
	LiwoWG6lQ79X/zbFY+deG1UemJSJD5BWUag/EITNZJNtSA2plISM6/rCTu+heafNeM8tslOIjrhO1
	GPWwwFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZzMC-003A4n-MY; Thu, 31 Mar 2022 18:17:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZzM9-003A4A-P4
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 18:17:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z12so593915lfu.10
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gADLe4HDBmNTTRadD9I18Eo59xDMA1VeRyu9AlQVupI=;
 b=crQ0nfYz9r5y0LNjvAz6Kl9GkH8VcN7+M3IRO0/MHMSfuwZ3QQbJPMFmMEChGOGuRi
 lgQsMapR+mH3g1uSCfkahgw35sLDQIFcmdfsSdI3qkJ8Vg8TWDA8dUjlprf7JcAT2Psh
 pjWsZFv1Yzq1yQ6rqecDWGyO9u5lr3MHZuD6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gADLe4HDBmNTTRadD9I18Eo59xDMA1VeRyu9AlQVupI=;
 b=qbYlNmuil6l+TBoIdh/IUcWqAa2P5l5JRa0RGnnpgIr1UdguhJwBqPbOmk0uobGeuD
 GZAc/wQ9GjOk2NheV1EXgJEIiXsT8w2QNMHw6PWUEVYObz75MLFsNYnoMgHQdclgoUim
 TRVd90DeYk4Jp0ZLiQRpfunThSxtwcnv/qhyCjUMcSzdR9qhYZjAexbuOXLY4DUeqgRg
 viAaQdg+BJOSkqZDIk8w0mA7vaa1HwjtHrrpmU6t9LCOWNOJwkZnlxMI54il+CLZ+rtN
 798Za/lkkCHE9sYvKlTKBmRerxxAfdg1M5sz1DMTkST60t8C+1k0kczl7aDupV/iJDaH
 Q7gg==
X-Gm-Message-State: AOAM533ykCxqmjnJpvJhg7q5wLkPgboAaQpknaf9PjQ3eugsro/5H4gY
 Xl4yXBncMZNilN39f0rrBSIRlZWy3MHGiEgu
X-Google-Smtp-Source: ABdhPJweimdzg9EU+/iGxMYh34Exa2iO+w+ofnKVfWXVMn8ftwINSkEblcH4qm+wRrb6+JABvj+U1w==
X-Received: by 2002:a05:6512:ad4:b0:44a:3366:20eb with SMTP id
 n20-20020a0565120ad400b0044a336620ebmr11322852lfu.379.1648750631149; 
 Thu, 31 Mar 2022 11:17:11 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 e27-20020a19501b000000b0044a8de01ad7sm11345lfb.24.2022.03.31.11.17.10
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 11:17:10 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id s13so878726ljd.5
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 11:17:10 -0700 (PDT)
X-Received: by 2002:a2e:9041:0:b0:24a:ce83:dcb4 with SMTP id
 n1-20020a2e9041000000b0024ace83dcb4mr11242362ljg.291.1648750629685; Thu, 31
 Mar 2022 11:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220126171442.1338740-1-aurelien@aurel32.net>
 <20220331103247.y33wvkxk5vfbqohf@pengutronix.de>
 <20220331103913.2vlneq6clnheuty6@pengutronix.de>
 <20220331105112.7t3qgtilhortkiq4@pengutronix.de>
In-Reply-To: <20220331105112.7t3qgtilhortkiq4@pengutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Mar 2022 11:16:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjnuMD091mNbY=fRm-qFyhMjbtfiwkAFKyFehyR8bPB5A@mail.gmail.com>
Message-ID: <CAHk-=wjnuMD091mNbY=fRm-qFyhMjbtfiwkAFKyFehyR8bPB5A@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Aurelien Jarno <aurelien@aurel32.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, 
 Kito Cheng <kito.cheng@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, ukl@pengutronix.de, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000009b482f05db87ab14"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_111713_876450_F1E5D4B0 
X-CRM114-Status: GOOD (  16.57  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--0000000000009b482f05db87ab14
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 3:51 AM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>
> Cc += linux-sparse, Uwe, Luc Van Oostenryck
>
> tl;dr:
>
> A recent change in the kernel regarding the riscv -march handling breaks
> current sparse.

Gaah. Normally sparse doesn't even look at the -march flag, but for
riscv it does, because it's meaningful for the predefined macros.

Maybe that 'die()' shouldn't be so fatal. And maybe add a few more
extensions (but ignore them) to the parsing.

Something ENTIRELY UNTESTED like the attached.

               Linus

--0000000000009b482f05db87ab14
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l1fbjlbv0>
X-Attachment-Id: f_l1fbjlbv0

IHRhcmdldC1yaXNjdi5jIHwgMTQgKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC1yaXNjdi5j
IGIvdGFyZ2V0LXJpc2N2LmMKaW5kZXggNmQ5MTEzYzEuLjIwMWFjMzc1IDEwMDY0NAotLS0gYS90
YXJnZXQtcmlzY3YuYworKysgYi90YXJnZXQtcmlzY3YuYwpAQCAtMyw2ICszLDcgQEAKICNpbmNs
dWRlICJ0YXJnZXQuaCIKICNpbmNsdWRlICJtYWNoaW5lLmgiCiAjaW5jbHVkZSA8c3RyaW5nLmg+
CisjaW5jbHVkZSA8c3RkaW8uaD4KIAogI2RlZmluZSBSSVNDVl8zMkJJVAkoMSA8PCAwKQogI2Rl
ZmluZSBSSVNDVl82NEJJVAkoMSA8PCAxKQpAQCAtNDcsNiArNDgsMTIgQEAgc3RhdGljIHZvaWQg
cGFyc2VfbWFyY2hfcmlzY3YoY29uc3QgY2hhciAqYXJnKQogCQl7ICJuIiwJCTAgfSwKIAkJeyAi
aCIsCQkwIH0sCiAJCXsgInMiLAkJMCB9LAorCQl7ICJpIiwJCTAgfSwKKwkJeyAiZSIsCQkwIH0s
CisJCXsgIl8iLAkJMCB9LAorCQl7ICJDb3VudGVycyIsCTAgfSwKKwkJeyAiWmljc3IiLAkwIH0s
CisJCXsgIlppZmVuY2VpIiwJMCB9LAogCX07CiAJaW50IGk7CiAKQEAgLTYwLDcgKzY3LDEwIEBA
IHN0YXRpYyB2b2lkIHBhcnNlX21hcmNoX3Jpc2N2KGNvbnN0IGNoYXIgKmFyZykKIAkJCWdvdG8g
ZXh0OwogCQl9CiAJfQotCWRpZSgiaW52YWxpZCBhcmd1bWVudCB0byAnLW1hcmNoJzogJyVzJ1xu
IiwgYXJnKTsKKwordW5rbm93bjoKKwlmcHJpbnRmKHN0ZGVyciwgIldBUk5JTkc6IGludmFsaWQg
YXJndW1lbnQgdG8gJy1tYXJjaCc6ICclcydcbiIsIGFyZyk7CisJcmV0dXJuOwogCiBleHQ6CiAJ
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZXh0ZW5zaW9ucyk7IGkrKykgewpAQCAtNzMsNyAr
ODMsNyBAQCBleHQ6CiAJCX0KIAl9CiAJaWYgKGFyZ1swXSkKLQkJZGllKCJpbnZhbGlkIGFyZ3Vt
ZW50IHRvICctbWFyY2gnOiAnJXMnXG4iLCBhcmcpOworCQlnb3RvIHVua25vd247CiB9CiAKIHN0
YXRpYyB2b2lkIGluaXRfcmlzY3YoY29uc3Qgc3RydWN0IHRhcmdldCAqc2VsZikK
--0000000000009b482f05db87ab14
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--0000000000009b482f05db87ab14--

