Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30650C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEreBMADoJL3DVEMJK+hEewcWlHAMguq8HB1wIUICAI=; b=xEiXXYcPD0ehbn
	r+6Sdky6mogXW5qMIlDDYKUCyYhelJNEQ2SC/XFlS/YKqjilPNlGm+ah5UfIFXZCx8m7a33FB70pT
	1GqTU6lnKHJXl7cxR8z9OkM/S6yofnK66q1VLKgCUipTwD5j8vZy21lPacVOh+2e5YEIIMBXLA4av
	ysVRdzK/ovFbVDY6dykzYh7KOfI53CNpXEavI/EYqFGHimWk30HSmTntX5FPoZzsMFB8sVo7JsRWx
	RDS8lTmB3IzRx4ZGtwLJsaTaqpxdovWGroO8k2ilhqQ02OnnqKhS+ZLAxxHtNc/JeGEVyxkqJSqdU
	h6FnhLLrqM38W1VyER1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaRY-00000003pky-09VE;
	Wed, 24 Apr 2024 11:05:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaRT-00000003pjx-10u6
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 11:05:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2a6fa7773d3so5421963a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713956733; x=1714561533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hfeg+vkRc0XGURMyAfV063gykKTzr+ZF/JApUeng1ww=;
        b=cm6r6HQAyVlUv2vtVqEpPGpi/eMJHiROwcglxKOuCvfPX4c+w2i47bp0Z9kwopgZIZ
         6RBuPPHW8YErakaXFiLVDCCXf8IeS/851lb1Vy12cK69fWO72gL3hgeOhmJiHhuRK0Wg
         cYdtd8cibMxUw2lRih1dnzqWkmIfkNoRUbt/jd0DMUOAKtDCuEmdDXhhEJxj7WHnKnYf
         rONOJWFx5f/yh3V9vySUEMeJQhkcBlt84XcOw7GMdIaE2cnqFm84FcWHVQ9/JmC9HInA
         S4jR1IRwUvb13fyn4NBboIVCU4S5EeFept7btB68FVPB2Qg8DTbONcHtOec1LrfXvRNC
         NNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713956733; x=1714561533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hfeg+vkRc0XGURMyAfV063gykKTzr+ZF/JApUeng1ww=;
        b=kFTmOJcu68Nos4WEy+GXNVWxXObgK84vagyp1a1X/8Bq9aXzj3kT2LJrlr7PveiPAV
         rs4eKtKSCqb9ZzLrN+5MI/1Rv7sk9HviDYNihbw0RetCiM3vLxfe3/GdkOE33r5xgfr1
         2iVLS5RsAt5qGZSuNBAC2bj9M8dNOGBUBf+blEdT33YIjgoZ118s+8WRjUqHNi4qVbN4
         8+wflZX3fSRhh+0GxCKnuDtqRH3FZ08ZIw/QxQxAc10A1J/j0ETuegWpVkP+b8lUIGHo
         4TnvDmywI8QRZvFoljyYpbF3+LQv/GmY/nF0RjkgmYK87CiGiQcQDxJBwHEvE0jWmor4
         uTwA==
X-Forwarded-Encrypted: i=1; AJvYcCV5h98+PeYdRAxdthekWlQ8HwnCYjMxh3edrvAOy/80Us2aIDq8kEQb5X2OEoEoTpze94V+O8IssZUCU9I8tXIlW6yb2OHuYwPExC66uB7C
X-Gm-Message-State: AOJu0YyRpkMZPQJc1hckmUx0bvrua/dKiuMChBqtTqXhocdOWnuPybzE
	QqYh/BZ/eti1/y83x+prHTR01D/fcXr3MjDFF5ZFPa4Zxor+QXntnRO7OgmU1JuEv+mtZghq1Ma
	KyGhUX1x+SWLJb48wyZtu0JzkUSXwE6cpxZXT
X-Google-Smtp-Source: AGHT+IEic7QQSlgq9C0C8F+g8FacTQEXHdXijyri2pwPNM/stSfAOYBuycpwBZxKBUdbffhcJ1pY4L9T/ve9zruna7A=
X-Received: by 2002:a17:90a:5909:b0:2a5:3399:b703 with SMTP id
 k9-20020a17090a590900b002a53399b703mr1941603pji.11.1713956733375; Wed, 24 Apr
 2024 04:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240322134728.151255-2-ajones@ventanamicro.com>
 <20240424-familiar-subdued-74d8922444df@spud> <20240424-d96185a44365c73d606c6526@orel>
In-Reply-To: <20240424-d96185a44365c73d606c6526@orel>
From: Woodrow Shen <woodrow.shen@sifive.com>
Date: Wed, 24 Apr 2024 19:05:21 +0800
Message-ID: <CABquHARs9eQPQvnH-zrqN-UTEitCyqkYa4rryyRuMf4X=DScUQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match
 constraints, take 2
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_040535_388270_2C74666D 
X-CRM114-Status: GOOD (  18.34  )
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

SGkgQW5kcmV3IGFuZCBDb25vciwKCkkgd2FzIG1pc3NpbmcgdGhpcyB0aHJlYWQgYW5kIGp1c3Qg
bm93IHRoaXMgcGF0Y2ggd2FzIHZlcmlmaWVkIGJ5IG15CmxvY2FsLCB0aGFuayB5b3UgZm9yIHJl
bWluZGluZyBtZS4KCkNoZWVycywKCk9uIFdlZCwgQXByIDI0LCAyMDI0IGF0IDY6MzPigK9QTSBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwg
QXByIDI0LCAyMDI0IGF0IDEwOjQxOjEwQU0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+
IE9uIEZyaSwgTWFyIDIyLCAyMDI0IGF0IDAyOjQ3OjI4UE0gKzAxMDAsIEFuZHJldyBKb25lcyB3
cm90ZToKPiA+ID4gQ29tbWl0IDBkZTY1Mjg4ZDc1ZiAoIlJJU0MtVjogc2VsZnRlc3RzOiBjYm86
IEVuc3VyZSBhc20gb3BlcmFuZHMKPiA+ID4gbWF0Y2ggY29uc3RyYWludHMiKSBhdHRlbXB0ZWQg
dG8gZW5zdXJlIE1LX0NCTygpIHdvdWxkIGFsd2F5cwo+ID4gPiBwcm92aWRlIHRvIGEgY29tcGls
ZS10aW1lIGNvbnN0YW50IHdoZW4gZ2l2ZW4gYSBjb25zdGFudCwgYnV0Cj4gPiA+IGNwdV90b19s
ZTMyKCkgaXNuJ3QgbmVjZXNzYXJpbHkgZ29pbmcgdG8gZG8gdGhhdC4gU3dpdGNoIHRvIG1hbnVh
bGx5Cj4gPiA+IHNoaWZ0aW5nIHRoZSBieXRlcywgd2hlbiBuZWVkZWQsIHRvIGZpbmFsbHkgZ2V0
IHRoaXMgcmlnaHQuCj4gPiA+Cj4gPiA+IFJlcG9ydGVkLWJ5OiBXb29kcm93IFNoZW4gPHdvb2Ry
b3cuc2hlbkBzaWZpdmUuY29tPgo+ID4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9DQUJxdUhBVGNCVFV3ZkxwZDlzUE9iQmdOb2JxUUtFQVoyeXhrK1RXU3B5TzV4dnBYcGdA
bWFpbC5nbWFpbC5jb20vCj4gPiA+IEZpeGVzOiBhMjllMmE0OGFmZTMgKCJSSVNDLVY6IHNlbGZ0
ZXN0czogQWRkIENCTyB0ZXN0cyIpCj4gPiA+IEZpeGVzOiAwZGU2NTI4OGQ3NWYgKCJSSVNDLVY6
IHNlbGZ0ZXN0czogY2JvOiBFbnN1cmUgYXNtIG9wZXJhbmRzIG1hdGNoIGNvbnN0cmFpbnRzIikK
PiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KPiA+Cj4gPiBUaGlzIGhhcyBiZWVuIHNpdHRpbmcgaW4gcGF0Y2h3b3JrIGZvciBhIHdoaWxl
IGFuZCBJIGRvbid0IHNlZSBhIG1lc3NhZ2UKPiA+IGZyb20gZWl0aGVyIHRoZSByZXBvcnRlciBz
YXlpbmcgdGhpcyB3YXMgYSBnb29kIGZpeCBvciBmcm9tIHRoZSBzZWxmdGVzdHMKPiA+IG1haW50
YWluZXIgdGhhdCBpdCBoYXMgYmVlbiBwaWNrZWQgdXAuIEkgd2FzIGdvbm5hIG1hcmsgaXQgImhh
bmRsZWQKPiA+IGVsc2V3aGVyZSIgYnV0IEkgbm90aWNlZCB0aGF0IHRoaXMgd2FzIG9ubHkgc2Vu
dCB0byB0aGUgcmlzY3YKPiA+IG1haW50YWluZXJzIHNvIHdlIHNob3VsZCBwcm9iYWJseSBoYXJh
c3MgUGFsbWVyIHRvZGF5IHRvIHBpY2sgdGhpcyB1cD8KPiA+Cj4KPiBZdXAuIFRoYW5rcyBmb3Ig
dGhlIHJlbWluZGVyIHRvIGZvbGxvdyB1cCEKPgo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
