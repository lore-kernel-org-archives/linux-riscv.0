Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324CECD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqVjlsWXt9sZHvqhkDWc0j+QlnSJZdJtc/pjxNgQ64c=; b=MzlDCe3bZCI9Cb
	Bgc3cPKJhVNJVQY0L/6x05AUP/LvybdJd2dpt+3Ke6bE2wm2ofUYkVP/og7poRqk2wKNwEADBNUB9
	7x1oikhxlNeULRBAUs36CI251YgfhxmNcDeBef+MPpUzH2AD+SCN+XxEo20TJrCsFAScI/HTvgRca
	F/FYzjjX9WKXi7h0tJakJDCocpCW4E7PY2sfSicfsU11qVI2pjDVvvtPNzxv+RfvDvWS8JBRfX3rW
	glL7LLWTOYsmVk27tz3GfYNT9aSQzY3scqrmpvCWgFyIMuSleiKPYTbrw0ALVTPylMlFmr387HR2N
	gWK0kFkmfsSof2j/HTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAM0-00000000eBw-2zcU;
	Wed, 03 Apr 2024 23:49:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsALy-00000000eAL-14PI
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KGucdcbEarAoxKuYez/Q9HRuJk+G9fqOigINMEt0goY=; b=o0u+/3haHSbVC3Z0QpToWhcTSB
	xIYUExdXuWDIsNozYAP8sP05VKLFWByzESE8IWIrc8HqM/JIX9bgISt5DvfPbtysA4YcVfOWValsi
	V/cgEZGjZrGps8p6VkuefbKyS4wvDj/CFRC3EIlMg0zxKhUzup7Q+Nz991zhfMGGwvWU+Wsn4TmRq
	myI7lcjbX9iH6qPgRgNiHTCFSfSPS9XoLKzQYRb/9PpWiL/3ii4g/XRbeNY1l7AnuMQcM7xCUsj2e
	lkNzElnBSQr0YBCUhILFLcSdZkyNXMddyIQu3tdNjTWCN4sj5AXGksTOfIanihcaUijpwdu6KSPAV
	JWrkeXzg==;
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsALr-00000004UXd-3Dql
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:49:11 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-432eeec88ebso2695401cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188143; x=1712792943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGucdcbEarAoxKuYez/Q9HRuJk+G9fqOigINMEt0goY=;
        b=U4rdQcnq2Mo/7CPeJPIjRAXqgLkUWx/9P+woOSsAKOT1dsp712QpZM9QjuDzFrrI1W
         Rb5YtZ1O/w+QM7/MXsREleVPN0HnJyOFdkvwwyo+pdoHMLZQBpFAfYgViqHHRjzr1cor
         Vy9J3rItguuwBBpVkGH1Dciuvzh0t3iDvonB3XK/V0oYY8NVItpvPAASDNt9fswY8zgB
         TBYNIy3Yhd6aGGiVor6JVJbbHCfXSzZ5bTA9iuNBdSs8iE1lg4Tva00TdktZwCATGJFA
         imIrfP9Lngrrro36xklxuJ5TFqTBiJOx4z/mM9HxWCDhpLcwc9DFguVDldfoUqEGiQU5
         AjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188143; x=1712792943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGucdcbEarAoxKuYez/Q9HRuJk+G9fqOigINMEt0goY=;
        b=RPvhDv1QwtinH6OJ3em/2U0puF+jRiMUbMQvR2PwYQqEFvLAYxCH7IsPHutjk53SE7
         kHkCSqo9jGBa9mTPmDEeCZpdH6+O1/dDBMJMiPev3vn6Dtz+uE43glQ0WHND5EdKoayH
         KUC5U/vn6gw2dELwdCv75ufJnTL7ps1+VEoBVXBC1obgD6FrGZV3YR8E9qK1+YFA3anN
         VzWMpi1jIc0AMk1rKqsYEpkIb93m84gv5dUe7D/vkYX5KA8oiAPTFstwc+pT7Ycx1EzY
         AOJnCvNeD5IdcgFkQ2hz8879pR93Tf3xlge5axQnIH668pZdHG53lEelaZOAt3sWI+5F
         wdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUYWCE1TIPp/ngOq0ifJvlhF5SeyOh4Wd7JkctA6XGufoy8Mzq+51rohGMIj1PubC0yHA7ncjI1T0SSi44qKd6vMFtlX00SiDdA7jo2ZOS
X-Gm-Message-State: AOJu0YxOZWVw03EaeV88vKoATo9gm9ytwcbjXua0wlv1C5EoL/0SjiMd
	xqsEQW0bT7e8dgEyvNnQlprqKHaLb0/HBo4iJueQv0lQH5OtV7wB48b0glx0M7qkgZfPvhoaheZ
	GoqUDxrSl2bOOXDhbFs2qq5kyAhF5ikL2wsgDF8SPFlvGHecuwX4=
X-Google-Smtp-Source: AGHT+IHPnPQwVv5MC6DjBNmcSUg3aww2ndiXlp0YCr+i2ghLZllCJ3lJZ/X280nXGVnMBVofOPtjQ373fmu8HkwBJDA=
X-Received: by 2002:a05:622a:138e:b0:434:3e9b:6692 with SMTP id
 o14-20020a05622a138e00b004343e9b6692mr1064206qtk.13.1712188143268; Wed, 03
 Apr 2024 16:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-8-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-8-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:48:26 -0400
Message-ID: <CA+CK2bCzJKPhUy9AeehHumFSu-poro_GwtNDRDmb5gn7-BwR2w@mail.gmail.com>
Subject: Re: [PATCH v12 07/11] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004910_150716_DB8A8D46 
X-CRM114-Status: UNSURE (   7.97  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEz4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gT24gc2V2ZXJhbCBwb3dlcnBjIHBsYXRmb3JtcywgYSBw
YWdlIHRhYmxlIGVudHJ5IG1heSBub3QgaW1wbHkgd2hldGhlcgo+IHRoZSByZWxldmFudCBtYXBw
aW5nIGlzIGZvciB1c2Vyc3BhY2Ugb3Iga2VybmVsc3BhY2UuIEluc3RlYWQsIHN1Y2gKPiBwbGF0
Zm9ybXMgaW5mZXIgdGhpcyBieSB0aGUgYWRkcmVzcyB3aGljaCBpcyBiZWluZyBhY2Nlc3NlZC4K
Pgo+IEFkZCBhbiBhZGRpdGlvbmFsIGFkZHJlc3MgYXJndW1lbnQgdG8gZWFjaCBvZiB0aGVzZSBy
b3V0aW5lcyBpbiBvcmRlciB0bwo+IHByb3ZpZGUgc3VwcG9ydCBmb3IgcGFnZSB0YWJsZSBjaGVj
ayBvbiBwb3dlcnBjLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+CgpSZXZpZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGlu
QHNvbGVlbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
