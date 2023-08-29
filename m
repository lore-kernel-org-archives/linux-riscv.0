Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C445C71153
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YoyeUa8FYyKVizLnWFrhN2SAzbDnP13jMRo9NZT1lM=; b=lv5efFKoNgl8jIwt4UqO7K8Y4X
	CERsu2UGA8JKdVqxoDchbZEW+DCsTZtJLcdgIEOumK/JEV+Le8msqOacXNgvl5UZlZ+mO1RljEB4L
	qK0S71PljKVTSCWo8G3aCOxGhJLWDxFTrR18RYAHok00BOOl/w2QU9qo75Sueljaz9epfv6JC8DoC
	lxVJtwn/pNNkQZcSNpIrxSkrz/ZGIv/itsiWnm3VY+r/uRLEkaxlE/2Rty671iQV5ixWw4+/MTcCr
	8JFqLv7t5DROXqKAakOLaJVeIdbMCZ5onSwgMyONW1pEVcWf+LJ+7PCSdXBG1qJMBeEpuJtEAwzfE
	/84WdZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0AM-00Bjkf-2u;
	Tue, 29 Aug 2023 14:58:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0AI-00BjjF-3C;
	Tue, 29 Aug 2023 14:58:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A375662B3B;
	Tue, 29 Aug 2023 14:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19045C433CA;
	Tue, 29 Aug 2023 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693321077;
	bh=Fl9B4teR2ctVm3KXwQCLY9l2XFGbxNokiCUT2ou36Zk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aFjNT1UTPwxm8wnpEI+PTouxjzprgXOpFSUIyE7vIDQ9GSQsiPGONY81Tv24jTR/b
	 J3bJlxre2uWHKFWbl6F2N4soUPR+59I/hN8scGYNR1irVznrpV+KC0V7yDg6Mx2+VI
	 h9nV7NSR9/r2mA1PXmL5uNRA5l0yEtlNsgMmt9ZXN/krPDI9tI7cciu+fI+C+pFwHF
	 At0qN1bnV/iA8CmbIsIxSem+JVnpyWDTza2Utk+9+BW9WbJ59E5gz+htCkSEQV/PC5
	 rLOCMD6fjfUmF7B++Hdh5e+8JMEYA6MJivWrnZac4tEOR3hmt/+yMFIYrO/sRy9DNf
	 bg6h+w576NLzg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-573429f5874so2449593eaf.0;
        Tue, 29 Aug 2023 07:57:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJ2GtbYc96aXlT9mcONHsXZcjvTyd091bYiLKocqrMxmjAmkWm
	gno02DVLexo8+L/riRz0QA81Ru9jwYbFchj0krI=
X-Google-Smtp-Source: AGHT+IEJcR/BSetNysrjC4m4cHhkpx9BbJUamjgdYuA7pG5fReFd96gQ5I/Q/OGxshuh2PEuYoeeODSQf7lSN/i0ON4=
X-Received: by 2002:a4a:dfc9:0:b0:56c:820e:7f02 with SMTP id
 p9-20020a4adfc9000000b0056c820e7f02mr14929879ood.0.1693321076338; Tue, 29 Aug
 2023 07:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230825194329.gonna.911-kees@kernel.org> <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse> <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
In-Reply-To: <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Aug 2023 23:57:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
Message-ID: <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Kees Cook <keescook@chromium.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000003f125a06041109f2"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_075759_131776_0A88589E 
X-CRM114-Status: GOOD (  32.07  )
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

--0000000000003f125a06041109f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 3:55=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Mon 28 Aug 2023 16:17:07 GMT, Michael Ellerman wrote:
> > Masahiro Yamada <masahiroy@kernel.org> writes:
> > > On Sat, Aug 26, 2023 at 4:55=E2=80=AFAM Kees Cook <keescook@chromium.=
org> wrote:
> > >>
> > >> Hi,
> > >>
> > >> This is my series to show *.config targets in the "help" target so t=
hese
> > >> various topics can be more easily discoverd.
> > >>
> > >> v2:
> > >>  - split .fragment from .config to hide "internal" fragments
> > >
> > > Please do not do this churn.
> >
> > That was my idea :}
> >
> > > Like Randy, I did not get "why" part quiet well,
> > > but if you are eager about this,
> > > you can show help message only when the following
> > > ("# Help:" prefix for example) is found in the first line.
> > >
> > > # Help: blah blah
> > > # other comment
> >
> > I did think of that, but wasn't sure how to do it in make.
>
> Something like this should do it:
>
>         @grep -Hnm1 -e '^# Help:' $(foreach f, $(sort $(notdir $(call con=
figfiles,*.config))), $(firstword $(call configfiles,$(f)))) | \
>          while read loc dummy helptext; do \
>                 tmp=3D"$${loc%:#}"; file=3D"$${tmp%:*}"; line=3D"$${tmp##=
*:}"; \
>                 [ "$${line}" =3D "1" ] && \
>                   printf "  %-25s - %s\\n" "$${file##*/}" "$${helptext}";=
 \
>          done
>
> but this neither beautiful nor elegant it likes to be improved.
>
> Kind regards,
> Nicolas




The attached patch will work too.

I dropped the "in the first line" restriction
because SPDX might be placed in the first line
of config fragments.



--=20
Best Regards
Masahiro Yamada

--0000000000003f125a06041109f2
Content-Type: text/x-patch; charset="US-ASCII"; name="config-help.diff"
Content-Disposition: attachment; filename="config-help.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_llwflp5x0>
X-Attachment-Id: f_llwflp5x0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggZTIxYmY2NmFmNmZkLi4yM2Nk
NjJhNWZmMDUgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xNTUyLDcg
KzE1NTIsNiBAQCBoZWxwOgogCUBlY2hvICAnICBtcnByb3BlcgkgIC0gUmVtb3ZlIGFsbCBnZW5l
cmF0ZWQgZmlsZXMgKyBjb25maWcgKyB2YXJpb3VzIGJhY2t1cCBmaWxlcycKIAlAZWNobyAgJyAg
ZGlzdGNsZWFuCSAgLSBtcnByb3BlciArIHJlbW92ZSBlZGl0b3IgYmFja3VwIGFuZCBwYXRjaCBm
aWxlcycKIAlAZWNobyAgJycKLQlAZWNobyAgJ0NvbmZpZ3VyYXRpb24gdGFyZ2V0czonCiAJQCQo
TUFLRSkgLWYgJChzcmN0cmVlKS9zY3JpcHRzL2tjb25maWcvTWFrZWZpbGUgaGVscAogCUBlY2hv
ICAnJwogCUBlY2hvICAnT3RoZXIgZ2VuZXJpYyB0YXJnZXRzOicKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L01ha2VmaWxlIGIvYXJjaC94ODYvTWFrZWZpbGUKaW5kZXggZmRjMmUzYWJkNjE1Li5jNGIy
YThhMTlmYzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L01ha2VmaWxlCisrKyBiL2FyY2gveDg2L01h
a2VmaWxlCkBAIC0zMzUsOSArMzM1LDUgQEAgZGVmaW5lIGFyY2hoZWxwCiAgIGVjaG8gICcJCQkg
IGJ6ZGlzay9mZGltYWdlKi9oZGltYWdlL2lzb2ltYWdlIGFsc28gYWNjZXB0OicKICAgZWNobyAg
JwkJCSAgRkRBUkdTPSIuLi4iICBhcmd1bWVudHMgZm9yIHRoZSBib290ZWQga2VybmVsJwogICBl
Y2hvICAnCQkJICBGRElOSVRSRD1maWxlIGluaXRyZCBmb3IgdGhlIGJvb3RlZCBrZXJuZWwnCi0g
IGVjaG8gICcnCi0gIGVjaG8gICcgIGt2bV9ndWVzdC5jb25maWcJLSBFbmFibGUgS2NvbmZpZyBp
dGVtcyBmb3IgcnVubmluZyB0aGlzIGtlcm5lbCBhcyBhIEtWTSBndWVzdCcKLSAgZWNobyAgJyAg
eGVuLmNvbmZpZwkJLSBFbmFibGUgS2NvbmZpZyBpdGVtcyBmb3IgcnVubmluZyB0aGlzIGtlcm5l
bCBhcyBhIFhlbiBndWVzdCcKLSAgZWNobyAgJyAgeDg2X2RlYnVnLmNvbmZpZwktIEVuYWJsZSB0
aXAgdHJlZSBkZWJ1Z2dpbmcgb3B0aW9ucyBmb3IgdGVzdGluZycKIAogZW5kZWYKZGlmZiAtLWdp
dCBhL2tlcm5lbC9jb25maWdzL2t2bV9ndWVzdC5jb25maWcgYi9rZXJuZWwvY29uZmlncy9rdm1f
Z3Vlc3QuY29uZmlnCmluZGV4IDIwODQ4MWQ5MTA5MC4uZDA4NzcwNjNkOTI1IDEwMDY0NAotLS0g
YS9rZXJuZWwvY29uZmlncy9rdm1fZ3Vlc3QuY29uZmlnCisrKyBiL2tlcm5lbC9jb25maWdzL2t2
bV9ndWVzdC5jb25maWcKQEAgLTEsMyArMSw0IEBACisjIEhlbHA6IEJvb3RhYmxlIGFzIGEgS1ZN
IGd1ZXN0CiBDT05GSUdfTkVUPXkKIENPTkZJR19ORVRfQ09SRT15CiBDT05GSUdfTkVUREVWSUNF
Uz15CmRpZmYgLS1naXQgYS9rZXJuZWwvY29uZmlncy94ODZfZGVidWcuY29uZmlnIGIva2VybmVs
L2NvbmZpZ3MveDg2X2RlYnVnLmNvbmZpZwppbmRleCA2ZmFjNWI0MDUzMzQuLjM1ZjQ4NjcxYjhk
NSAxMDA2NDQKLS0tIGEva2VybmVsL2NvbmZpZ3MveDg2X2RlYnVnLmNvbmZpZworKysgYi9rZXJu
ZWwvY29uZmlncy94ODZfZGVidWcuY29uZmlnCkBAIC0xLDMgKzEsNCBAQAorIyBIZWxwOiBEZWJ1
Z2dpbmcgb3B0aW9ucyBmb3IgdGlwIHRyZWUgdGVzdGluZwogQ09ORklHX1g4Nl9ERUJVR19GUFU9
eQogQ09ORklHX0xPQ0tfU1RBVD15CiBDT05GSUdfREVCVUdfVk09eQpkaWZmIC0tZ2l0IGEva2Vy
bmVsL2NvbmZpZ3MveGVuLmNvbmZpZyBiL2tlcm5lbC9jb25maWdzL3hlbi5jb25maWcKaW5kZXgg
NDM2ZjgwNmFhMWVkLi42ODc4YjlhNDliZTggMTAwNjQ0Ci0tLSBhL2tlcm5lbC9jb25maWdzL3hl
bi5jb25maWcKKysrIGIva2VybmVsL2NvbmZpZ3MveGVuLmNvbmZpZwpAQCAtMSwzICsxLDUgQEAK
KyMgSGVscDogQm9vdGFibGUgYXMgYSBYZW4gZ3Vlc3QKKyMKICMgZ2xvYmFsIHN0dWZmIC0gdGhl
c2UgZW5hYmxlIHVzIHRvIGFsbG93IHNvbWUKICMgb2YgdGhlIG5vdCBzbyBnZW5lcmljIHN0dWZm
IGJlbG93IGZvciB4ZW4KIENPTkZJR19QQVJBVklSVD15CmRpZmYgLS1naXQgYS9zY3JpcHRzL2tj
b25maWcvTWFrZWZpbGUgYi9zY3JpcHRzL2tjb25maWcvTWFrZWZpbGUKaW5kZXggYWYxYzk2MTk4
ZjQ5Li5lNzJjNWVlNjU5YTkgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9NYWtlZmlsZQor
KysgYi9zY3JpcHRzL2tjb25maWcvTWFrZWZpbGUKQEAgLTkzLDExICs5MywxMyBAQCBlbmRpZgog
JV9kZWZjb25maWc6ICQob2JqKS9jb25mCiAJJChRKSQ8ICQoc2lsZW50KSAtLWRlZmNvbmZpZz1h
cmNoLyQoU1JDQVJDSCkvY29uZmlncy8kQCAkKEtjb25maWcpCiAKLWNvbmZpZ2ZpbGVzPSQod2ls
ZGNhcmQgJChzcmN0cmVlKS9rZXJuZWwvY29uZmlncy8kQCAkKHNyY3RyZWUpL2FyY2gvJChTUkNB
UkNIKS9jb25maWdzLyRAKQorY29uZmlnZmlsZXMgPSAkKHdpbGRjYXJkICQoc3JjdHJlZSkva2Vy
bmVsL2NvbmZpZ3MvJCgxKSAkKHNyY3RyZWUpL2FyY2gvJChTUkNBUkNIKS9jb25maWdzLyQoMSkp
CithbGwtY29uZmlnLWZyYWdtZW50cyA9ICQoY2FsbCBjb25maWdmaWxlcywqKQorY29uZmlnLWZy
YWdtZW50cyA9ICQoY2FsbCBjb25maWdmaWxlcywkQCkKIAogJS5jb25maWc6ICQob2JqKS9jb25m
Ci0JJChpZiAkKGNhbGwgY29uZmlnZmlsZXMpLCwgJChlcnJvciBObyBjb25maWd1cmF0aW9uIGV4
aXN0cyBmb3IgdGhpcyB0YXJnZXQgb24gdGhpcyBhcmNoaXRlY3R1cmUpKQotCSQoUSkkKENPTkZJ
R19TSEVMTCkgJChzcmN0cmVlKS9zY3JpcHRzL2tjb25maWcvbWVyZ2VfY29uZmlnLnNoIC1tIC5j
b25maWcgJChjb25maWdmaWxlcykKKwkkKGlmICQoY29uZmlnLWZyYWdtZW50cyksLCAkKGVycm9y
ICRAIGZyYWdtZW50IGRvZXMgbm90IGV4aXN0cyBvbiB0aGlzIGFyY2hpdGVjdHVyZSkpCisJJChR
KSQoQ09ORklHX1NIRUxMKSAkKHNyY3RyZWUpL3NjcmlwdHMva2NvbmZpZy9tZXJnZV9jb25maWcu
c2ggLW0gLmNvbmZpZyAkKGNvbmZpZy1mcmFnbWVudHMpCiAJJChRKSQoTUFLRSkgLWYgJChzcmN0
cmVlKS9NYWtlZmlsZSBvbGRkZWZjb25maWcKIAogUEhPTlkgKz0gdGlueWNvbmZpZwpAQCAtMTE1
LDYgKzExNyw3IEBAIGNsZWFuLWZpbGVzICs9IHRlc3RzLy5jYWNoZQogCiAjIEhlbHAgdGV4dCB1
c2VkIGJ5IG1ha2UgaGVscAogaGVscDoKKwlAZWNobyAgJ0NvbmZpZ3VyYXRpb24gdGFyZ2V0czon
CiAJQGVjaG8gICcgIGNvbmZpZwkgIC0gVXBkYXRlIGN1cnJlbnQgY29uZmlnIHV0aWxpc2luZyBh
IGxpbmUtb3JpZW50ZWQgcHJvZ3JhbScKIAlAZWNobyAgJyAgbmNvbmZpZyAgICAgICAgIC0gVXBk
YXRlIGN1cnJlbnQgY29uZmlnIHV0aWxpc2luZyBhIG5jdXJzZXMgbWVudSBiYXNlZCBwcm9ncmFt
JwogCUBlY2hvICAnICBtZW51Y29uZmlnCSAgLSBVcGRhdGUgY3VycmVudCBjb25maWcgdXRpbGlz
aW5nIGEgbWVudSBiYXNlZCBwcm9ncmFtJwpAQCAtMTQxLDYgKzE0NCwxMiBAQCBoZWxwOgogCUBl
Y2hvICAnICAgICAgICAgICAgICAgICAgICBkZWZhdWx0IHZhbHVlIHdpdGhvdXQgcHJvbXB0aW5n
JwogCUBlY2hvICAnICB0aW55Y29uZmlnCSAgLSBDb25maWd1cmUgdGhlIHRpbmllc3QgcG9zc2li
bGUga2VybmVsJwogCUBlY2hvICAnICB0ZXN0Y29uZmlnCSAgLSBSdW4gS2NvbmZpZyB1bml0IHRl
c3RzIChyZXF1aXJlcyBweXRob24zIGFuZCBweXRlc3QpJworCUBlY2hvICAnJworCUBlY2hvICAn
Q29uZmlndXJhdGlvbiB0b3BpYyB0YXJnZXRzOicKKwlAJChmb3JlYWNoIGYsICQoYWxsLWNvbmZp
Zy1mcmFnbWVudHMpLCBcCisJCWlmIGhlbHA9JCQoZ3JlcCAtbTEgJ14jIEhlbHA6ICcgJChmKSk7
IHRoZW4gXAorCQkJcHJpbnRmICcgICUtMjVzIC0gJXNcbicgJyQobm90ZGlyICQoZikpJyAiJCR7
aGVscCMqOiB9IjsgXAorCQlmaTspCiAKICMgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAjIG9iamVjdCBm
aWxlcyB1c2VkIGJ5IGFsbCBrY29uZmlnIGZsYXZvdXJzCg==
--0000000000003f125a06041109f2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--0000000000003f125a06041109f2--

